//
//  SettingsTVC.swift
//  Visa Check
//
//  Created by Денис Андриевский on 1/18/20.
//  Copyright © 2020 Денис Андриевский. All rights reserved.
//

import UIKit

class SettingsTVC: UITableViewController {
    
    private let titlesDataBase = ["Rate us on the App Store".localized, "Change Passport Country".localized, "Write an e-mail to developer".localized]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Navigation Item
        let backItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .plain, target: self, action: #selector(backBtnPressed))
        backItem.tintColor = UIColor(named: "backColor")
        navigationItem.leftBarButtonItem = backItem
        navigationItem.title = "Settings".localized
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "backColor")!]
        tableView.separatorStyle = .none
        
        let backView = UIView()
        backView.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        tableView.backgroundView = backView
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 50
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 30
        }
        return 20
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8941176471, green: 0.8941176471, blue: 0.8941176471, alpha: 1)
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titlesDataBase[indexPath.section]
        cell.accessoryType = .disclosureIndicator
        cell.layer.shadowRadius = 10
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = .zero
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.textLabel?.font = UIFont(name: "Avenir-Medium", size: 22)
        cell.backgroundColor = UIColor.white
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.minimumScaleFactor = 0.3
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            rateBtnPressed()
        case 1:
            changeBtnPressed()
        case 2:
            writeEmail()
        default:
            print("Error")
        }
    }

    @objc func backBtnPressed() {
        self.present(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Tabbar"), animated: true, completion: nil)
    }
    
    func writeEmail() {
        let email = "andrievskiy03@meta.ua"
        if let url = URL(string: "mailto:\(email)") {
            UIApplication.shared.open(url)
        }
    }
    
    func rateBtnPressed() {
        let appleID = "1495216078"
        let appStoreLink = "https://itunes.apple.com/app/id\(appleID)?action=write-review"
        UIApplication.shared.open(URL(string: appStoreLink)!, options: [:], completionHandler: nil)
    }
       
    func changeBtnPressed() {
        UserDefaults.standard.set(true, forKey: "changing")
        self.present(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StartVC"), animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
