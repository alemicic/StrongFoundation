//
//  RootTabView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 13.11.23..
//

import SwiftUI

//enum HomeNavigation: Hashable {
//    case assetDetail(AssetDetailVM)
//}
//
//enum SettingsNavigation: Hashable {
//    case main, details
//}

struct RootTabView: View {
    enum Tab {
        case home, settings
    }
    
    @State private var selectedTab: Tab = .home
    @State public var homeNavigationStack: [ScreenNavigation] = []
    @State public var settingsNavigationStack: [ScreenNavigation] = []
    
    var body: some View {
        
        TabView(selection: tabSelection()) {
            HomeScreen(path: $homeNavigationStack)
                .tabItem {
                    Label("Home",
                          systemImage: "house.fill")
                }
                .tag(Tab.home)
            
            Text("Tab 2")
                .tabItem {
                    Label("Settings",
                          systemImage: "gearshape")
                }
                .tag(Tab.settings)
        }
    }
    
    private func tabSelection() -> Binding<Tab> {
        Binding {
            selectedTab
        } set: { tappedTab in
            if tappedTab == selectedTab {
                if homeNavigationStack.isEmpty {
                    //User already on home view, scroll to top
                } else {
                    //Pop to root view by clearing the stack
                    homeNavigationStack = []
                }
            }
            selectedTab = tappedTab
        }
    }
}

#Preview {
    RootTabView()
}
