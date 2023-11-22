//
//  NavigationViewModel.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 21.11.23..
//

import Foundation
import SwiftUI
import Combine

protocol Completeable {
    var didComplete: PassthroughSubject<Self, Never> { get }
}

protocol Navigable: Identifiable, Hashable {}

extension Navigable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum ScreenNavigation: Hashable {
    case assetDetail(vm: AssetDetailVM)
}

class NavigationVM: ObservableObject {
    var subscription = Set<AnyCancellable>()
    
    @Published var homeNavigationPath: [ScreenNavigation] = []
    @Published var channelsNavigationPath: [ScreenNavigation] = []
    @Published var settingsNavigationPath: [ScreenNavigation] = []
    
    init(homeNavigationPath: [ScreenNavigation] = [],
         channelsNavigationPath: [ScreenNavigation] = [],
         settingsNavigationPath: [ScreenNavigation] = []) {
        self.homeNavigationPath = homeNavigationPath
        self.channelsNavigationPath = channelsNavigationPath
        self.settingsNavigationPath = settingsNavigationPath
    }
    
//    func makeScreen1PhoneVM() -> Screen1PhoneVM {
//        let vm = Screen1PhoneVM(phoneNumber: model.phoneNumber)
//        vm.didComplete
//            .sink(receiveValue: didComplete1)
//            .store(in: &subscription)
//        return vm
//    }
//
//    func didComplete1(vm: Screen1PhoneVM) {
//        // Additional logic inc. updating model
//        model.phoneNumber = vm.phoneNumber
//        navigationPath.append(.screen2(vm: makeScreen2VerificationVM()))
//    }
    
    func openAssetDetailsOnHome(assetModel: AssetModel) {
        homeNavigationPath.append(.assetDetail(vm: makeAssetDetailsVM(assetModel: assetModel)))
    }
      
    func popHomeToRoot() {
        homeNavigationPath = []
    }
    
    func popChannelsToRoot() {
        channelsNavigationPath = []
    }
    
    func popSettingsToRoot() {
        settingsNavigationPath = []
    }
    
    func popHome() {
        homeNavigationPath.removeLast()
    }
    
    func popChannels() {
        channelsNavigationPath.removeLast()
    }
    
    func popSettings() {
        settingsNavigationPath.removeLast()
    }
}

extension NavigationVM {
    func makeHomeScreenVM() -> HomeScreenViewModel {
        let vm = HomeScreenViewModel(items: [])
        vm.didComplete
            .sink(receiveValue: openAssetDetailsOnHome)
            .store(in: &subscription)
        return vm
    }
    
    func makeAssetDetailsVM(assetModel: AssetModel) -> AssetDetailVM {
        AssetDetailVM(assetModel: assetModel)
    }
}
