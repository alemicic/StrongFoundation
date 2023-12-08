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
        case home, list, channels, settings
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
            
            NavigationStack(path: $navigationVM.listNavigationPath) {
                ListView(vm: navigationVM.makeListVM())
            }
            .tabItem {
                Label("List",
                      systemImage: "list.bullet.clipboard.fill")
            }
            .tag(Tab.list)
            
            NavigationStack(path: $navigationVM.channelsNavigationPath) {
                ChannelsScreen(vm: navigationVM.makeChannelVM())
            }
            .tabItem {
                Label("Channels",
                      systemImage: "tv.fill")
            }
            .tag(Tab.channels)
            
            NavigationStack(path: $navigationVM.settingsNavigationPath) {
                SettingsScreen(vm: navigationVM.makeSettingsVM())
                    .navigationDestination(for: SettingsScreenNavigation.self) { screen in
                        switch screen {
                            case .account(vm: let vm):
                                SettingsAccountView(vm: vm)
                            case .language(vm: let vm):
                                SettingsLanguageView(vm: vm)
                            case .videoQuality(vm: let vm):
                                SettingsVideoQualityView(vm: vm)
                            case .changePin(vm: let vm):
                                SettingsChangePinView(vm: vm)
                        }
                    }
            }
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
                    case .list:
                        if navigationVM.homeNavigationPath.isEmpty {
                            //User already on home view, scroll to top
                        } else {
                            //Pop to root view by clearing the stack
                            navigationVM.popListToRoot()
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
