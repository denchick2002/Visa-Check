//
//  String+Ext.swift
//  Visa Check
//
//  Created by Денис Андриевский on 1/18/20.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
