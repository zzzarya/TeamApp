//
//  NumberViewController.swift
//  TeamApp
//
//  Created by Илья on 08.09.2022.
//

import UIKit

class NumberViewController: UIViewController {

    @IBOutlet var nextBotton: UIButton!
    
    @IBOutlet var numberTF: UITextField!
    
    private var person = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingBottom(for: nextBotton)
        settingTF(for: numberTF)
    }
    
    @IBAction func closeButtom(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func checkButton(_ sender: Any) {
        if let text = numberTF.text, !text.isEmpty, text.count == 11 {
            if numberTF.text == person.numberPhone {
                performSegue(withIdentifier: "forProfile", sender: nil)
            } else {
                person = Person(name: "",
                                password: "",
                                numberPhone: numberTF.text ?? "",
                                email: "",
                                avatar: "",
                                address: "")
//                showAlert(with: "Все бывает в перввый раз", and: "Раньше ты к нам не заходил, заведем новый профиль")
            }
        } else {
            showAlert(with: "Введите настоящий телефон", and: "Номер указан с ошибкой")
        }
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        
        if let passwordVC = navigationVC.topViewController as? PasswordViewController {
            passwordVC.person = person
        } else if let profileVC = navigationVC.topViewController as? ProfileViewController {
            profileVC.person = person
        }
//        guard let passwordVC = navigationVC.topViewController as? PasswordViewController else { return }
//        passwordVC.person = person
//
//        guard let profileVC = navigationVC.topViewController as? ProfileViewController else { return }
//        profileVC.person = person
    }
    
    private func settingBottom(for item: UIButton) {
           item.layer.cornerRadius = 10
           item.backgroundColor = .systemBlue
    }
    
    private func settingTF(for item: UITextField) {
        item.text = "7"
    }

}

extension NumberViewController {
    private func showAlert(with title: String, and massage: String) {
        
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        let Ok = UIAlertAction(title: "Ok", style: .default) { _ in
            self.numberTF.text = ""
        }
        
        alert.addAction(Ok)
        present(alert, animated: true)
    }
}
