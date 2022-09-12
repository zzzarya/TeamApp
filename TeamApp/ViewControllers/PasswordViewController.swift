//
//  PasswordViewController.swift
//  TeamApp
//
//  Created by Илья on 08.09.2022.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet var nextButton: UIButton!
    
    @IBOutlet var passwordTF: UITextField!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingBottom(for: nextButton)
        passwordTF.autocorrectionType = .no
    }
    

    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func checkButton() {
        if let text = passwordTF.text, !text.isEmpty, text.count >= 4 {
                person = Person(name: "Аноним",
                                password: passwordTF.text ?? "",
                                numberPhone: person.numberPhone,
                                email: "Почты пока нет",
                                avatar: "anonimus",
                                address: "Адреса пока нет")
            } else {
                showAlert(with: "Давайте проверим пароль", and: "Должен состоять из более 4 символов")
        }
    }

    private func settingBottom(for item: UIButton) {
           item.layer.cornerRadius = 10
           item.backgroundColor = .systemBlue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let profileVC = navigationVC.topViewController as? ProfileViewController else { return }
        profileVC.person = person
    }
    
}

extension PasswordViewController {
    private func showAlert(with title: String, and massage: String) {
        
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        let Ok = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordTF.text = ""
        }
        
        alert.addAction(Ok)
        present(alert, animated: true)
    }
}
