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
        let filterStrings = ["Ukraine 🇺🇦", "Russia 🇷🇺", "Belarus 🇧🇾", "Украина 🇺🇦", "Россия 🇷🇺", "Беларусь 🇧🇾", "Україна 🇺🇦", "Росія 🇷🇺", "Білорусь 🇧🇾"]
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
            guard let data = snapshot.value as? [[String: Any]] else { return }
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

