//
//  FavouritesVC.swift
//  Visa Check
//
//  Created by Денис Андриевский on 1/18/20.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import UIKit
import Lottie

class FavouritesVC: UIViewController, UITableViewDelegate, UISearchResultsUpdating {

    @IBOutlet weak var tableView: UITableView!
    private let converter = Converter()
    var imageData = [String: Data]()
    var permanentDataBase = [VisaRequirement]()
    private var searchController: UISearchController!
    var selectedCountry: VisaRequirement!
    var selectedImageData: Data!
    var favoritesDataBase = [String]()
    var dataBase = [VisaRequirement]()
    private var lottieView: UIView!
    private let animationView = AnimationView()
    private var dimmView = UIView(frame: CGRect(x: 0, y: 0, width: 3000, height: 3000))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let imageData = UserDefaults.standard.value(forKey: "imageData") as? [String: Data] {
            self.imageData = imageData
        }
        dimmView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
        dimmView.isHidden = true
        lottieView = UIView(frame: CGRect(x: (view.frame.width-200)/2, y: (view.frame.height-200)/2, width: 200, height: 200))
        view.addSubview(lottieView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 320
        tableView.separatorStyle = .none
        let backView = UIView()
        backView.backgroundColor = .white
        tableView.backgroundView = backView
        UIApplication.shared.keyWindow?.addSubview(dimmView)
        startAnimation()
        DispatchQueue.global(qos: .utility).async {
            
            if let dataBase = UserDefaults.standard.value(forKey: "dataBase") as? [[String: Any]] {
                self.dataBase = self.converter.decode(data: dataBase).visaRequirements
            }
                
            if let dataBase1 = UserDefaults.standard.value(forKey: "favourites") as? [String] {
                self.favoritesDataBase = dataBase1
            }
                   
            var buffer = [VisaRequirement]()
            self.dataBase.forEach { req in
                if self.favoritesDataBase.contains(req.destinationCountry.name) {
                    buffer.append(req)
                }
            }
            self.dataBase = buffer
            self.permanentDataBase = self.dataBase
            
            DispatchQueue.main.async {
                self.dimmView.isHidden = true
                self.lottieView.isHidden = true
                self.animationView.stop()
                self.tableView.reloadData()
            }
            
            self.dataBase.forEach { requirement in
                    
                if let url = URL(string: requirement.destinationCountry.imageURL) {
                    let session = URLSession(configuration: .default)
                    let task = session.dataTask(with: url) { (data, response, error) in
                        if let error = error {
                            print(error.localizedDescription)
                        } else if let data = data {
                            DispatchQueue.main.async {
                                self.imageData[requirement.destinationCountry.name] = data
                            }
                        }
                    }
                    task.resume()
                }
            }
        }
               
        // MARK:- SearchController Configuring
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search countries...".localized
        let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField
        textField?.textColor = .black
        let glassIconView = textField?.leftView as! UIImageView
        glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
        glassIconView.tintColor = UIColor(named: "backColor")
        searchController.searchBar.backgroundImage = UIImage()
        searchController.searchBar.tintColor = UIColor(named: "backColor")
        searchController.searchBar.backgroundColor = .white
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.reloadData()
    }

    func startAnimation() {
        dimmView.isHidden = false
        lottieView.isHidden = false
        animationView.animation = Animation.named("128-around-the-world")
        animationView.frame.size = lottieView.frame.size
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        lottieView.addSubview(animationView)
        animationView.backgroundBehavior = .pauseAndRestore

        animationView.play()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        self.dataBase = [VisaRequirement]()
        if let text = searchController.searchBar.text, text != "" {
            var searchText = ""
            text.forEach { char in
                searchText += String(char) == " " ? "" : String(char)
            }
            
            self.permanentDataBase.forEach { requirement in
                if requirement.destinationCountry.name.lowercased().contains(searchText.lowercased()) {
                    self.dataBase.append(requirement)
                }
            }
        } else {
            self.dataBase = self.permanentDataBase
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.searchController = searchController
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? DetailCountryTVC {
            detail.country = selectedCountry
            detail.countryImageData = selectedImageData
            UserDefaults.standard.set(imageData, forKey: "imageData")
        }
    }
    
    override var prefersStatusBarHidden: Bool {
           return true
       }


    func showSearchController() {
        self.navigationItem.searchController = searchController
        self.searchController.searchBar.becomeFirstResponder()
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        showSearchController()
    }
    
    @IBAction func unwindToFavourite(_ segue: UIStoryboardSegue) {}

}
