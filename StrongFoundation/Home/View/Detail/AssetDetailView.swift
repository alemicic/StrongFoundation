//
//  AssetDetailView.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 21.11.23..
//

import SwiftUI

struct AssetDetailView: View {
    @StateObject var vm: AssetDetailVM
    
    var body: some View {
        Image(vm.assetModel.imageStr)
            .resizable()
            .scaledToFit()
            .border(Color.blue, width: 1)
        TitleDescriptionView(title: vm.assetModel.title,
                             description: vm.assetModel.description)
        .border(Color.red, width: 1)
        Spacer()
    }
}

#Preview {
    AssetDetailView(vm: AssetDetailVM(assetModel: AssetModel(id: 0, title: "titlerino long", description: "description long", imageStr: "lotr64")))
}
