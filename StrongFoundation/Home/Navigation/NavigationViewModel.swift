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
//    var subscription = Set<AnyCancellable>()
    
    @Published var navigationPath: [ScreenNavigation] = []
    
//    func makeScreen1PhoneVM() -> Screen1PhoneVM {
//        let vm = Screen1PhoneVM(phoneNumber: model.phoneNumber)
//        vm.didComplete
//            .sink(receiveValue: didComplete1)
//            .store(in: &subscription)
//        return vm
//    }
//    
//    TODO: prekrsti u push
//    func didComplete1(vm: Screen1PhoneVM) {
//        // Additional logic inc. updating model
//        model.phoneNumber = vm.phoneNumber
//        navigationPath.append(.screen2(vm: makeScreen2VerificationVM()))
//    }
    
    func push(screen: ScreenNavigation) {
        navigationPath.append(screen)
    }
    
    func popToRoot() {
        navigationPath = []
    }
    
    func pop() {
        navigationPath.removeLast()
    }
}
