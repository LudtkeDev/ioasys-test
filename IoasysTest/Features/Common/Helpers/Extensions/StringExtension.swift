//
//  StringExtension.swift
//  Common
//
//  Created by Gustavo Ludtke on 22/10/20.
//  Copyright © 2020 Gustavo Ludtke. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

public extension String {
    
    func asStoryboard(inBundle bundle: Bundle?,
                      fromContainer container: Container) -> SwinjectStoryboard {
        
        return SwinjectStoryboard.create(name: self, bundle: bundle, container: container)
    }
    
    func asViewController(inStoryboard storyboard: SwinjectStoryboard,
                          fromContainer container: Container) -> UIViewController? {
        return storyboard.instantiateViewController(withIdentifier: self)
    }
}
