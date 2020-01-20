//
//  RateService.swift
//  Visa Check
//
//  Created by Денис Андриевский on 1/18/20.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import UIKit
import StoreKit

class RateService {
    
    let defaults = UserDefaults.standard
    
    func showRateAlert() {
        guard let ratesCount = defaults.value(forKey: "ratesCount") as? Int else { defaults.set(1, forKey: "ratesCount"); return }
        if ratesCount == 10 || ratesCount == 25 || ratesCount == 40 {
            SKStoreReviewController.requestReview()
        }
        defaults.set(ratesCount+1, forKey: "ratesCount")
    }
    
}
