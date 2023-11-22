//
//  StrongFoundationApp.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 12.11.23..
//

import SwiftUI

@main
struct StrongFoundationApp: App {
    let persistenceController = PersistenceController.shared

//    static var navigationVM = NavigationVM(path.wrappedValue)
    var body: some Scene {
        WindowGroup {
            RootTabView()
//            HomeScreen(path: RootTabView().$homeNavigationStack,
//                       vm: NavigationVM([]).makeHomeScreenVM())
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
