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
    associatedtype T
    var didComplete: PassthroughSubject<T, Never> { get }
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
//    case settingsDetail(type: SettingsDetailType)
}

enum SettingsScreenNavigation: Hashable {
    case account(vm: SettingsAccountVM)
    case language(vm: SettingsLanguageVM)
    case videoQuality(vm: SettingsVideoQualityVM)
    case changePin(vm: SettingsChangePinVM)
}

class NavigationVM: ObservableObject {
    var subscription = Set<AnyCancellable>()
    
    @Published var homeNavigationPath: [ScreenNavigation] = []
    @Published var listNavigationPath: [ScreenNavigation] = []
    @Published var channelsNavigationPath: [ScreenNavigation] = []
    @Published var settingsNavigationPath: [SettingsScreenNavigation] = []
    
    init(homeNavigationPath: [ScreenNavigation] = [],
         channelsNavigationPath: [ScreenNavigation] = [],
         settingsNavigationPath: [SettingsScreenNavigation] = []) {
        self.homeNavigationPath = homeNavigationPath
        self.channelsNavigationPath = channelsNavigationPath
        self.settingsNavigationPath = settingsNavigationPath
    }
    
    func openAssetDetailsOnHome(assetModel: AssetModel) {
        homeNavigationPath.append(.assetDetail(vm: makeAssetDetailsVM(assetModel: assetModel)))
    }
    
    func openSettingsDetailsOnSettings(settingsItem: SettingsItem) {
        switch settingsItem.type {
            case .account:
                settingsNavigationPath.append(.account(vm: SettingsAccountVM(accountName: "Pera")))
            case .changePin:
                settingsNavigationPath.append(.changePin(vm: SettingsChangePinVM()))
            case .language:
                let list = [
                    LanguageModel(name: "English", isSelected: false),
                    LanguageModel(name: "Serbian", isSelected: true),
                    LanguageModel(name: "Hungarian", isSelected: false),
                    LanguageModel(name: "Romanian", isSelected: false)
                ]
                settingsNavigationPath.append(.language(vm: SettingsLanguageVM(languages: list)))
            case .videoQuality:
                settingsNavigationPath.append(
                    .videoQuality(
                        vm: SettingsVideoQualityVM(
                            isWifiOn: true,
                            selectedWifi: "true?",
                            isCellularOn: false,
                            selectedCellular: "false?")))
        }
    }
    
    func popHomeToRoot() {
        homeNavigationPath = []
    }
    
    func popListToRoot() {
        channelsNavigationPath = []
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
    
    func makeListVM() -> ListVM {
        ListVM()
    }
    
    func makeChannelVM() -> ChannelsVM {
        ChannelsVM()
    }
    
    func makeSettingsVM() -> SettingsVM {
        let vm = SettingsVM()
        vm.didComplete
            .sink(receiveValue: openSettingsDetailsOnSettings)
            .store(in: &subscription)
        return vm
    }
    
    func makeAssetDetailsVM(assetModel: AssetModel) -> AssetDetailVM {
        AssetDetailVM(assetModel: assetModel)
    }
}
