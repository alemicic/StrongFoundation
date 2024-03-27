//
//  ListView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 30.11.23..
//

import SwiftUI

struct ListView: View {
    @StateObject var vm: ListVM
    
    var body: some View {
        Section {
            Text("Prva lista")
        }
        .padding(.horizontal16)
        ScrollView() {
//            ForEach(0..<500) {_ in
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(vm.items1) { item in
                            AssetHorizontalItemView(title: item.title,
                                                    image: item.imageStr)
                        }
                        .background(.white)
                        .listStyle(.insetGrouped)
                    }
                }
                .background(.thinMaterial)
                .padding(.horizontal16)
                .scrollIndicators(.hidden)
                
                Section {
                    Text("Druga lista")
                }
                .padding(.horizontal16)
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(vm.items2) { item in
                            AssetHorizontalItemView(title: item.title,
                                                    image: item.imageStr)
                        }
                        .background(.white)
                        .listStyle(.insetGrouped)
                    }
                }
                .background(.thinMaterial)
                .padding(.horizontal16)
                .scrollIndicators(.hidden)
//            }
        }
    }
}

#Preview {
    ListView(vm: ListVM())
}
