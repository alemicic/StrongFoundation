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
        case home, channels, settings
    }
    
    @State private var selectedTab: Tab = .home
    @StateObject public var navigationVM: NavigationVM
    
    init() {
        self.selectedTab = .home
        _navigationVM = StateObject(wrappedValue: NavigationVM())
    }
    var body: some View {
        
        TabView(selection: tabSelection()) {
            NavigationStack(path: $navigationVM.homeNavigationPath) {
                HomeScreen(vm: navigationVM.makeHomeScreenVM(),
                           navigationVM: _navigationVM)
                .navigationDestination(for: ScreenNavigation.self) { screen in
                    switch screen {
                        case .assetDetail(vm: let vm):
                            AssetDetailView(vm: vm)
                    }
                }
            }
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
                switch tappedTab {
                    case .home:
                        if navigationVM.homeNavigationPath.isEmpty {
                            //User already on home view, scroll to top
                        } else {
                            //Pop to root view by clearing the stack
                            navigationVM.popHomeToRoot()
                        }
                    case .channels:
                        if navigationVM.channelsNavigationPath.isEmpty {
                            //User already on home view, scroll to top
                        } else {
                            //Pop to root view by clearing the stack
                            navigationVM.popChannelsToRoot()
                        }
                    case .settings:
                        if navigationVM.settingsNavigationPath.isEmpty {
                            //User already on home view, scroll to top
                        } else {
                            //Pop to root view by clearing the stack
                            navigationVM.popSettingsToRoot()
                        }
                }
            }
            selectedTab = tappedTab
        }
    }
}

#Preview {
    RootTabView()
}
