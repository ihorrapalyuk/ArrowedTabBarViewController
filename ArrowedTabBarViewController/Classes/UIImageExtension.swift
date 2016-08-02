//
//  UIImageExtension.swift
//  OnGo
//
//  Created by Taras Chernyshenko on 11/25/15.
//  Copyright © 2015 Lezgro. All rights reserved.
//

import UIKit
import AssetsLibrary

extension UIImage {
    
    typealias Completion = (UIImage?) -> Void
    
    enum AssetIdentifier: String {
        case TabbarArrow = "tabbar_arrow"
        case TabbarShadow = "tabbar_shadow"
    }
    
    convenience init!(assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)
    }
}
