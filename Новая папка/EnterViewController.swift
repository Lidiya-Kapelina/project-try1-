//
//  EnterViewController.swift
//  project
//
//  Created by Лидия  on 05.07.2024.
//

import UIKit
/*class User {
    var name: String
    var dateOfBirth: String
    var weight: String
    var contactData: String
    var login: String
    var password: String
    init(name: String, dateOfBirth: String, weight: String, contactData: String, login: String, password: String) {
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.weight = weight
        self.contactData = contactData
        self.login = login
        self.password = password
    }
    
}*/
var globalLogin=""
class EnterViewController: UIViewController {
  
    
    @IBOutlet weak var userLogin: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func enterButtom(_ sender: Any) {
        if (userLogin.text != "0"){
            if (UserDefaults.standard.dictionary(forKey: userLogin.text ?? "0")?["password"] as? String == userPassword.text){
                globalLogin = userLogin.text ?? ""
                let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                self.navigationController?.pushViewController(storyboard, animated: true)
            } else{
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") as! ErrorViewController
            self.navigationController?.pushViewController(storyboard, animated: true)            }
            
        }
        else{
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ErrorViewController") as! ErrorViewController
        self.navigationController?.pushViewController(storyboard, animated: true)            }
    }
    
       /* if (login.text == log1 && password.text == pas1 || login.text == log2 && password.text == pas2 || login.text == log3 && password.text == pas3){
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "ViewController4") as! ViewController4
            self.navigationController?.pushViewController(storyboard, animated: true)
            
        } else {
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            self.navigationController?.pushViewController(storyboard, animated: true)
        }*/
    
    
}
