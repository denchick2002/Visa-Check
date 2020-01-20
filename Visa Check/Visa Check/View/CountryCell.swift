//
//  CountryCell.swift
//  Countries
//
//  Created by Денис Андриевский on 12/27/19.
//  Copyright © 2019 Денис Андриевский. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    @IBOutlet weak var backImg: UIImageView! {
        didSet {
            backImg.layer.cornerRadius = 10
            backImg.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var visaLabel: UILabel! 
    @IBOutlet weak var backView: UIView! {
        didSet {
            backView.layer.cornerRadius = 10
            backView.layer.shadowRadius = 1
            backView.layer.shadowOpacity = 1
            backView.layer.shadowOffset = .zero
            backView.layer.shadowColor = UIColor.lightGray.cgColor
        }
    }
    @IBOutlet weak var favoritesImg: UIImageView!
    @IBOutlet weak var dimmView: UIView! {
        didSet {
            dimmView.layer.cornerRadius = 10
            dimmView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
