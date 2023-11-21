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

    var body: some Scene {
        WindowGroup {
            HomeScreen(path: RootTabView().$homeNavigationStack)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
