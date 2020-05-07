//
//  DetailCountryTVC.swift
//  Visa Check
//
//  Created by Денис Андриевский on 1/12/20.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import UIKit

class DetailCountryTVC: UITableViewController {
    
    var country: VisaRequirement!
    var countryImageData: Data?
    private let rateService = RateService()
    private let converter = Converter()
    private var favoritesDataBase = [String]()
    
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var visaLabel: RoundedCornerLabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var subregionLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var timeZonesLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var exchangePriceLabel: UILabel!
    @IBOutlet weak var visaDurationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoritesBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        // MARK:- Configuring
        nameLabel.text = "\(country.destinationCountry.name)"
        visaLabel.text = " \(country.visaCategory.name.rawValue.localized)  "
        capitalLabel.text = country.destinationCountry.capital != nil ? country.destinationCountry.capital : "No information"
        subregionLabel.text = country.destinationCountry.subregion
        populationLabel.text = country.destinationCountry.population
        timeZonesLabel.text = country.destinationCountry.timeZones
        languagesLabel.text = country.destinationCountry.languageNames
        exchangePriceLabel.text = country.exchangePrice != nil ? "100 \(country.exchangePrice!.originCurrencyCode) = \(Double(Int(10000*country.exchangePrice!.price))/100) \(country.exchangePrice!.destinationCurrencyCode)" : "No information"
        visaDurationLabel.text = country.duration
        priceLabel.text = country.flightPrice != nil ? "\(country.flightPrice!.minPrice) \(country.flightPrice!.currency)" : "No info"
        let backView = UIView()
        backView.backgroundColor = .white
        tableView.backgroundView = backView
        
        if let data = countryImageData {
            countryImage.image = UIImage(data: data)
        } else {
            countryImage.image = UIImage(named: "travel")
        }
        
        // Navigation Item
        let backItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(backBtnPressed))
        backItem.tintColor = UIColor(named: "backColor")
        navigationItem.leftBarButtonItem = backItem
        navigationItem.title = "Country".localized
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "backColor")!]
        tableView.separatorStyle = .none
        
        let shareItem = UIBarButtonItem(image: UIImage(named: "share"), style: .plain, target: self, action: #selector(shareBtnPressed))
        shareItem.tintColor = UIColor(named: "backColor")
        navigationItem.rightBarButtonItem = shareItem
        
        rateService.showRateAlert()
        
        if let dataBase1 = UserDefaults.standard.value(forKey: "favourites") as? [String] {
            self.favoritesDataBase = dataBase1
        }
   
        if favoritesDataBase.contains(country.destinationCountry.name) {
            favoritesBtn.setImage(UIImage(named: "favorites2"), for: .normal)
        }
       
    }
    
 
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 6
    }

    @IBAction func findFlightsBtnPressed(_ sender: Any) {
        var originCountry = ""
        var currency = ""
        switch UserDefaults.standard.value(forKey: "country") as! String {
        case "ukraine":
            originCountry = "UA"
            currency = "UAH"
        case "russia":
            originCountry = "RU"
            currency = "RUB"
        case "belarus":
            originCountry = "BY"
            currency = "BYN"
        default:
            originCountry = ""
        }
        let flightURL = "https://www.skyscanner.com/transport/flights/\(originCountry)/\(country.destinationCountry.alpha2Code)/200119/200126/?rtn=1&adultsv2=1&currency=\(currency)&associateid=API_B2B_18969_00003&utm_medium=b2b&utm_campaign=flights&utm_source=VisaList"
        guard let url = URL(string: flightURL) else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func temperatureCardPressed(_ sender: Any) {
        
        var name = ""
        country.destinationCountry.name.lowercased().forEach { char in
            name += char == " " ? String("-") : String(char)
        }
        let urlString = "https://www.climatestotravel.com/climate/\(name)"
        guard let url = URL(string: urlString) else {
            let alertController = UIAlertController(title: "Oops..".localized, message: "No temperature data available for this country".localized, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        UIApplication.shared.open(url)
    }
    
    @IBAction func visaURLPressed(_ sender: Any) {
    
        guard var urlString = country.destinationCountry.visaProcessingURL else {
            let alertController = UIAlertController(title: "Oops..".localized, message: "No visa processing data available for this country".localized, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        if Locale.current.languageCode == "ru" || Locale.current.languageCode == "uk" {
            var buffer = ""
            var first = true
            urlString.forEach { char in
                if (char == "w" || char == ".") && first {} else {
                    if char == "i" && first {
                        buffer += "ru."
                        first = false
                    }
                    buffer += String(char)
                }
                
            }
            urlString = buffer
        }
        
        guard let url = URL(string: urlString) else {
            let alertController = UIAlertController(title: "Oops..".localized, message: "No visa processing data available for this country".localized, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        UIApplication.shared.open(url)
    }
    
    @objc func backBtnPressed() {
        if tabBarController?.tabBar.selectedItem?.title == "Favorites".localized {
            performSegue(withIdentifier: "unwind2", sender: self)
        } else {
            performSegue(withIdentifier: "unwindToList", sender: self)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func addToFavorites() {
        favoritesDataBase.append(country.destinationCountry.name)
        UserDefaults.standard.set(favoritesDataBase, forKey: "favourites")
        favoritesBtn.setImage(UIImage(named: "favorites2"), for: .normal)
        
    }
    
    func removeFromFavorites() {
        var buffer = [String]()
        favoritesDataBase.forEach { cy in
            if cy != country.destinationCountry.name {
                buffer.append(cy)
            }
        }
        UserDefaults.standard.set(buffer, forKey: "favourites")
        favoritesBtn.setImage(UIImage(named: "favorites1"), for: .normal)
    }
    
    @IBAction func favoritesBtnPressed(_ sender: Any) {
        
        if favoritesDataBase.contains(country.destinationCountry.name) {
            removeFromFavorites()
            if let dataBase1 = UserDefaults.standard.value(forKey: "favourites") as? [String] {
                self.favoritesDataBase = dataBase1
            }
        } else {
            addToFavorites()
        }
        
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
           if let swipeGesture = gesture as? UISwipeGestureRecognizer {
               switch swipeGesture.direction {
               case UISwipeGestureRecognizer.Direction.right:
                   if tabBarController?.tabBar.selectedItem?.title == "Favorites".localized {
                       performSegue(withIdentifier: "unwind2", sender: self)
                   } else {
                       performSegue(withIdentifier: "unwindToList", sender: self)
                   }
               default:
                   break
               }
           }
       }
    
    @objc func shareBtnPressed() {
        let defaultText = """
Check this country: \(self.country.destinationCountry.name)
        
Capital: \(self.country.destinationCountry.capital ?? "No info")
Region: \(self.country.destinationCountry.subregion)
Population: \(self.country.destinationCountry.population)
Send from Tourist Assistance
https://itunes.apple.com/app/id1495216078?action=write-review
"""
        
        let activityController: UIActivityViewController
        
        if let imgData = countryImageData, let imageToShare = UIImage(data: imgData) {
            activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
        } else  {
            activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
        }
        
        self.present(activityController, animated: true, completion: nil)
    }
    
}
