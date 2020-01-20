//
//  UINavigationController+Ext.swift
//  Visa Check
//
//  Created by Денис Андриевский on 1/14/20.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
    
    open override var childForStatusBarHidden: UIViewController? {
        return topViewController
    }
    
}
