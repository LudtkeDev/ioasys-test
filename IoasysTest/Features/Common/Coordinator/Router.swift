//
//  Router.swift
//  Common
//
//  Created by Gustavo Ludtke on 16/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation
import UIKit

public protocol Destination {
    var viewControllerType: UIViewController.Type { get }
    var storyboardName: String { get }
//    func asViewController(fromContainer container: Container) -> UIViewController?
}

public extension Destination {
    var viewControllerType: UIViewController.Type { UIViewController.self }
}
