//
//  RoundedCornerButton.swift
//  Visa Check
//
//  Created by Денис Андриевский on 1/12/20.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedCornerButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    func customizeView() {
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    }
    
}
