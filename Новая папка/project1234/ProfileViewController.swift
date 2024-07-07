//
//  ProfileViewController.swift
//  project1234
//
//  Created by Лидия  on 06.07.2024.
//
import UIKit

class ProfileViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var contactData: UITextField!
    var label: UILabel = UILabel()
        override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(label)
            
            // Устанавливаем делегаты для текстовых полей
            name.delegate = self
            dateOfBirth.delegate = self
            weight.delegate = self
            contactData.delegate = self

            // Выводим в text field значения из словаря
            updateTextFields()
        }

        func updateTextFields() {
            name.text = UserDefaults.standard.dictionary(forKey: globalLogin)?["name"] as? String
            dateOfBirth.text = UserDefaults.standard.dictionary(forKey: globalLogin)?["dateOfBirth"] as? String
            weight.text = UserDefaults.standard.dictionary(forKey: globalLogin)?["weight"] as? String
            contactData.text = UserDefaults.standard.dictionary(forKey: globalLogin)?["contactData"] as? String
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            // Получаем словарь из UserDefaults
            var dict = UserDefaults.standard.dictionary(forKey: globalLogin) ?? [:]

            // Обновляем значения в словаре на основе текстовых полей
            dict["contactData"] = contactData.text
            dict["name"] = name.text
            dict["weight"] = weight.text
            dict["dateOfBirth"] = dateOfBirth.text

            // Сохраняем обновленный словарь в UserDefaults
            UserDefaults.standard.setValue(dict, forKey: globalLogin)

            // Обновляем текст в текстовых полях
            updateTextFields()
        }
    }
