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
    let animationView = AnimationView()
    @IBOutlet weak var insertLabel: UILabel!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: SearchTextField!
    @IBOutlet weak var searchTop: NSLayoutConstraint!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var submitBtnTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var submitBtnLeadinngConstraint: NSLayoutConstraint!
    private let converter = Converter()
    private var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        update(forCountry: "ukraine")
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        searchTop.constant = 248*(view.frame.size.height/812)
        searchView.layer.cornerRadius = 10.0
        submitBtn.layer.cornerRadius = 10.0
        submitBtnLeadinngConstraint.constant = 118*(view.frame.size.width/375)
        submitBtnTrailingConstraint.constant = 118*(view.frame.size.width/375)
        
        // MARK:- Configuring autocompletable textField
        searchTextField.delegate = self
        searchTextField.filterStrings(["Ukraine 🇺🇦", "Russia 🇷🇺", "Belarus 🇧🇾"])
        searchTextField.maxResultsListHeight = 200
        searchTextField.theme.cellHeight = 50
        searchTextField.theme.font = UIFont.systemFont(ofSize: 18)
        
        if #available(iOS 12.0, *), traitCollection.userInterfaceStyle == .dark {
            searchTextField.theme = .darkTheme()
            searchTextField.filterStrings(["Ukraine 🇺🇦", "Russia 🇷🇺", "Belarus 🇧🇾"])
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
        case "ukraine🇺🇦", "ukraine":
            chooseCountry(name: "ukraine")
        case "russia🇷🇺", "russia":
            chooseCountry(name: "russia")
        case "belarus🇧🇾", "belarus":
            chooseCountry(name: "belarus")
        default:
            let alertController = UIAlertController(title: "Oops..", message: "Something went wrong. Check the country name please", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    func startAnimation() {
        dimmView.isHidden = false
        lottieView.isHidden = false
        animationView.animation = Animation.named("128-around-the-world")
        animationView.frame.size = lottieView.frame.size
        animationView.contentMode = .scaleToFill
        animationView.loopMode = .loop
        lottieView.addSubview(animationView)
        animationView.backgroundBehavior = .pauseAndRestore

        animationView.play()
    }
    
    func chooseCountry(name: String) {
        let defaults = UserDefaults.standard
        defaults.set(name, forKey: "country")
        startAnimation()
    }
    
}

