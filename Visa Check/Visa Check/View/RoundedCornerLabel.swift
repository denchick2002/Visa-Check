//
//  RoundedCornerLabel.swift
//  Countries
//
//  Created by Денис Андриевский on 12/27/19.
//  Copyright © 2019 Денис Андриевский. All rights reserved.
//

import UIKit
@IBDesignable
class RoundedCornerLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    func customizeView() {
        layer.cornerRadius = 14
        layer.masksToBounds = true
    }

}
