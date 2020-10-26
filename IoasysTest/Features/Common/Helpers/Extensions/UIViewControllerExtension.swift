//
//  UIViewControllerExtension.swift
//  Common
//
//  Created by Gustavo Ludtke on 22/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    static var bundle: Bundle {
        return Bundle(for: self)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
