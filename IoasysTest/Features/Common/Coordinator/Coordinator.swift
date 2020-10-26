//
//  Coordinator.swift
//  AppNavigation
//
//  Created by Gustavo Ludtke on 15/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation
import UIKit
import Swinject

public protocol Coordinator: class {
    var navigationController: UINavigationController { get set }
    var container: Container { get }
    
    func start()
    func shouldNavigateWithAnimation() -> Bool
}

extension Coordinator {
    public func shouldNavigateWithAnimation() -> Bool {
        return true
    }
}

