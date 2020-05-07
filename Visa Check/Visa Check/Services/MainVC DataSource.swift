//
//  MainVC DataSource.swift
//  Countries
//
//  Created by Денис Андриевский on 12/27/19.
//  Copyright © 2019 Денис Андриевский. All rights reserved.
//

import UIKit

extension MainVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CountryCell.self), for: indexPath) as! CountryCell
        let country = dataBase[indexPath.row]
        cell.nameLabel.text = "\(country.destinationCountry.name)"
        cell.capitalLabel.text = country.destinationCountry.capital != nil ? country.destinationCountry.capital : "No information"
        cell.regionLabel.text = country.destinationCountry.subregion
        cell.visaLabel.text = country.visaCategory.name.rawValue.localized
        
        if let imgData = imageData[country.destinationCountry.name] {
            cell.backImg.image = UIImage(data: imgData)
        }
        
        if favoritesDataBase.contains(country.destinationCountry.name) {
            cell.favoritesImg.isHidden = false
        } else {
            cell.favoritesImg.isHidden = true
        }
        
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountry = dataBase[indexPath.row]
        selectedImageData = imageData[selectedCountry.destinationCountry.name]
        performSegue(withIdentifier: "detail", sender: self)
    }
    
}
