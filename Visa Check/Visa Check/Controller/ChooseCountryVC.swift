//
//  ViewController.swift
//  Visa Check
//
//  Created by Денис Андриевский on 12/28/19.
//  Copyright © 2019 Денис Андриевский. All rights reserved.
//

import UIKit
import SearchTextField
import Lottie
import FirebaseDatabase

class ChooseCountryVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var dimmView: UIView!
    @IBOutlet weak var lottieView: UIView!
    private let animationView = AnimationView()
    @IBOutlet weak var insertLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: SearchTextField!
    @IBOutlet weak var searchTop: NSLayoutConstraint!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var submitBtnTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var submitBtnLeadinngConstraint: NSLayoutConstraint!
    private let converter = Converter()
    private var ref: DatabaseReference!
    private var dataBase: Country!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.value(forKey: "firstLaunch") == nil {
            UserDefaults.standard.removeObject(forKey: "leastDate")
            UserDefaults.standard.set(true, forKey: "firstLaunch")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        searchTop.constant = 248*(view.frame.size.height/812)
        searchView.layer.cornerRadius = 10.0
        submitBtn.layer.cornerRadius = 10.0
        submitBtnLeadinngConstraint.constant = 118*(view.frame.size.width/375)
        submitBtnTrailingConstraint.constant = 118*(view.frame.size.width/375)
        submitBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        submitBtn.titleLabel?.minimumScaleFactor = 0.3
        
        // MARK:- Configuring autocompletable textField
        searchTextField.delegate = self
        var filterStrings = [String]()
        switch Locale.current.languageCode {
        case "uk":
            filterStrings = ["Україна 🇺🇦", "Росія 🇷🇺", "Білорусь 🇧🇾", "Сполучені Штати 🇺🇸", "Великобританія 🇬🇧", "Молдова 🇲🇩", "Казахстан 🇰🇿", "Узбекистан 🇺🇿", "Туркменістан 🇹🇲", "Азербайджан 🇦🇿", "Вірменія 🇦🇲", "Таджикистан 🇹🇯", "Киргизстан 🇰🇬"]
        case "ru":
            filterStrings = ["Украина 🇺🇦", "Россия 🇷🇺", "Беларусь 🇧🇾", "Соединённые Штаты 🇺🇸", "Великобритания 🇬🇧", "Молдова 🇲🇩", "Казахстан 🇰🇿", "Узбекистан 🇺🇿", "Туркменистан 🇹🇲", "Азербайджан 🇦🇿", "Армения 🇦🇲", "Таджикистан 🇹🇯", "Кыргызстан 🇰🇬"]
        default:
            filterStrings = ["Ukraine 🇺🇦", "Russia 🇷🇺", "Belarus 🇧🇾", "United States 🇺🇸", "United Kingdom 🇬🇧", "Moldova 🇲🇩", "Kazakhstan 🇰🇿", "Uzbekistan 🇺🇿", "Turkmenistan 🇹🇲", "Azerbaijan 🇦🇿", "Armenia 🇦🇲", "Tajikistan 🇹🇯", "Kyrgyzstan 🇰🇬"]
        }
        searchTextField.filterStrings(filterStrings)
        searchTextField.maxResultsListHeight = 200
        searchTextField.theme.cellHeight = 50
        searchTextField.theme.font = UIFont.systemFont(ofSize: 18)
        
        if #available(iOS 12.0, *), traitCollection.userInterfaceStyle == .dark {
            searchTextField.theme = .darkTheme()
            searchTextField.filterStrings(filterStrings)
            searchTextField.maxResultsListHeight = 200
            searchTextField.theme.cellHeight = 50
            searchTextField.theme.font = UIFont.systemFont(ofSize: 18)
        }
    }
    
    func update(forCountry country: String) {
        let urlString = "https://visalist.io/api/public/visa_requirements/country/\(country)"
            if let url = URL(string: urlString) {
            
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else if let data = data {
                        print("AA")
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let parsedData = try! decoder.decode(Country.self, from: data)
                        self.ref = Database.database().reference()
                        self.ref.child(country).setValue(self.converter.encode(country: parsedData))
                    }
                }
                task.resume()
            }
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserDefaults.standard.value(forKey: "changing") == nil {
            if let oldDate = UserDefaults.standard.value(forKey: "leastDate") as? Date, let minDifference = Calendar.current.dateComponents([.day], from: oldDate, to: Date()).day, minDifference < 1 {
                    self.performSegue(withIdentifier: "proceed", sender: self)
            } else if let name = UserDefaults.standard.value(forKey: "country") as? String {
                startAnimation()
                getData(forCountry: name) { (snapshot) in
                guard let data = snapshot.value as? [[String: Any]] else { return }
                    let receivedData = self.converter.decode(data: data)
                    self.dataBase = receivedData
                    self.animationView.stop()
                    UserDefaults.standard.set(data, forKey: "dataBase")
                    UserDefaults.standard.set(Date(), forKey: "leastDate")
                    self.performSegue(withIdentifier: "proceed", sender: self)
                }
            }
        } else {
            UserDefaults.standard.removeObject(forKey: "changing")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func deleteBtnPressed(_ sender: Any) {
        searchTextField.text = ""
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func submitBtnPressed(_ sender: Any) {
        let searchString = searchTextField.text ?? ""
        var searchText = ""
        searchString.forEach { char in
            searchText += String(char) == " " ? "" : String(char)
        }
        switch searchText.lowercased() {
        case "ukraine🇺🇦", "ukraine", "украина", "украина🇺🇦", "україна", "україна🇺🇦":
            chooseCountry(name: "ukraine")
        case "russia🇷🇺", "russia", "россия", "россия🇷🇺", "росія", "росія🇷🇺":
            chooseCountry(name: "russia")
        case "belarus🇧🇾", "belarus", "беларусь🇧🇾", "беларусь", "білорусь", "білорусь🇧🇾":
            chooseCountry(name: "belarus")
        case "сполученіштати", "сполученіштати🇺🇸", "unitedstates🇺🇸", "unitedstates", "соединённыештаты🇺🇸", "соединённыештаты":
            chooseCountry(name: "united-states-of-america")
        case "unitedkingdom", "unitedkingdom🇬🇧", "великобритания🇬🇧", "великобритания", "великобританія🇬🇧", "великобританія":
            chooseCountry(name: "united-kingdom")
        case "moldova🇲🇩", "moldova", "молдова", "молдова🇲🇩":
            chooseCountry(name: "moldova")
        case "kazakhstan🇰🇿", "kazakhstan", "казахстан", "казахстан🇰🇿":
            chooseCountry(name: "kazakhstan")
        case "uzbekistan🇺🇿", "uzbekistan", "узбекистан", "узбекистан🇺🇿":
            chooseCountry(name: "uzbekistan")
        case "turkmenistan🇹🇲", "turkmenistan", "туркменистан", "туркменистан🇹🇲", "туркменістан", "туркменістан🇹🇲":
            chooseCountry(name: "turkmenistan")
        case "azerbaijan🇦🇿", "azerbaijan", "азербайджан🇦🇿", "азербайджан":
            chooseCountry(name: "azerbaijan")
        case "armenia🇦🇲", "armenia", "армения🇦🇲", "армения", "вірменія", "вірменія🇦🇲":
            chooseCountry(name: "armenia")
        case "tajikistan🇹🇯", "tajikistan", "таджикистан", "таджикистан🇹🇯":
            chooseCountry(name: "tajikistan")
        case "kyrgyzstan", "kyrgyzstan🇰🇬", "кыргызстан🇰🇬", "киргизстан🇰🇬", "кыргызстан", "киргизстан":
            chooseCountry(name: "kyrgyzstan")
        default:
            let alertController = UIAlertController(title: "Oops..".localized, message: "Something went wrong. Check the country name please".localized, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
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
    
    
    func chooseCountry(name: String) {
        let defaults = UserDefaults.standard
        defaults.set(name, forKey: "country")
        startAnimation()
        
        getData(forCountry: name) { (snapshot) in
            guard let data1 = snapshot.value as? [[String: Any]] else { return }
            let data = data1.shuffled()
            let receivedData = self.converter.decode(data: data)
            self.dataBase = receivedData
            self.animationView.stop()
            UserDefaults.standard.set(data, forKey: "dataBase")
            UserDefaults.standard.set(Date(), forKey: "leastDate")
            self.performSegue(withIdentifier: "proceed", sender: self)
        }
        
    }
    
    func getData(forCountry country: String, completionHandler: @escaping (DataSnapshot) -> Void) {
        ref = Database.database().reference()
        
        ref.child(country).observeSingleEvent(of: .value, with: completionHandler)
        Timer.scheduledTimer(withTimeInterval: 20, repeats: false) { (_) in
            let alertController = UIAlertController(title: "Bad Internet Connection".localized, message: "Please, check your Internet connection speed".localized, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    
}

