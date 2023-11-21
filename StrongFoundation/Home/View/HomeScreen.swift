//
//  ContentView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 12.11.23..
//

import SwiftUI
import CoreData

struct HomeScreen: View {
        @Binding var path: [ScreenNavigation]
//    @Environment(\.managedObjectContext) private var viewContext

    ///TODO istrazi sta ovo radi
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
    
    
//    private var items: FetchedResults<Item>
    
    @StateObject var vm = HomeViewModel(items: [])
    @StateObject var navigationVM = NavigationVM()

    var body: some View {
        NavigationStack(path: $path) {
            TextField(StringConstants.tfTitlePlaceholder, text: $vm.title)
                .padding(.horizontal)
            // TODO: make custom textFieldStyle
                .textFieldStyle(.roundedBorder)
                .labelStyle(.titleOnly)
            TextField(StringConstants.tfDescriptionPlaceholder, text: $vm.description)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            List {
                ForEach(vm.items) { item in
                    AssetListItemView(title: item.title,
                                      description: item.description,
                                      image: item.imageStr)
                        .listRowInsets(EdgeInsets())
                        .onTapGesture {
                            print("@@@@@@")
                            navigationVM.push(screen: ScreenNavigation.assetDetail(vm: AssetDetailVM(assetModel: item)))
                        }
                        
                }
                .onDelete(perform: deleteItems)
                .clipped()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
        .navigationDestination(for: ScreenNavigation.self) { screen in
            switch screen {
                case .assetDetail(vm: let vm):
                    AssetDetailView(vm: vm)
            }
        }
    }

    private func addItem() {
        withAnimation {
            // MARK: Check if empty, show toast, color fields red and shake fields
            let newItem = AssetModel(id: vm.autoIncrement, title: vm.title, description: vm.description, imageStr: "lotr64")
            vm.items.append(newItem)
            vm.resetValues()

//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            vm.items.remove(atOffsets: offsets)
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    HomeScreen(path: RootTabView().$homeNavigationStack)
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
