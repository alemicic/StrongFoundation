//
//  EdgeInsets+Extensions.swift
//  StrongFoundation
//
//  Created by Aleksandar Micic on 12.11.23..
//

import Foundation
import SwiftUI

extension EdgeInsets {
    static var padding4: EdgeInsets {
        EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
    }
    static var padding8: EdgeInsets {
        EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    }
    static var padding16: EdgeInsets {
        EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
    }
    static var horizontal16: EdgeInsets {
        EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
    }
}
