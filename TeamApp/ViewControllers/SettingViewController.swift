//
//  SettingViewController.swift
//  TeamApp
//
//  Created by Илья on 09.09.2022.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var telephoneTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var adressTF: UITextField!
    
    @IBOutlet var oldPasswordTF: UITextField!
    @IBOutlet var newPasswordTF: UITextField!
    
    var delegat: SaveInfoDelegate!
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupTF()
        getTFDelegat()
        
    }
    
    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        delegat.setInfo(person)
        dismiss(animated: true)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setupTF() {
        nameTF.text = person.name
        telephoneTF.text = person.numberPhone
        emailTF.text = person.email
        adressTF.text = person.address
    }
    
    private func getTFDelegat() {
        nameTF.delegate = self
        telephoneTF.delegate = self
        emailTF.delegate = self
        adressTF.delegate = self
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            view.endEditing(true)
        }

}

extension SettingViewController: UITextFieldDelegate {
        
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        switch textField{
        case nameTF:
            person.name = text
        case telephoneTF:
            person.numberPhone = text
        case emailTF:
            person.email = text
        case oldPasswordTF:
            if text == person.password {
                person.password = newPasswordTF.text ?? ""
            } else {
                showAlert(title: "Пароль не совпадает",
                          message: "Проверь что ты написал")
            }
        case newPasswordTF:
            if text.count >= 4, !text.isEmpty {
                person.password = text
            }
        default:
            person.address = text
        }
        
        if oldPasswordTF.text == person.password {
            person.password = newPasswordTF.text ?? ""
        }
    
//        showAlert(title: "Ошибочный формат!",
//                  message: "Проверь что ты написал")
    }
}
