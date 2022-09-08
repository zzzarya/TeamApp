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
    
    private let person = Person.getPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingBottom(for: nextBotton)
        settingTF(for: numberTF)
    }
    
    @IBAction func checkButton(_ sender: Any) {
        if numberTF.text == String(person.numberPhone) {
            
        } else {
            showAlert(with: "Зарегистриемся?", and: "Вы входите в первый раз")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func settingBottom(for item: UIButton) {
           item.layer.cornerRadius = 10
           item.backgroundColor = .systemBlue
    }
    
    private func settingTF(for item: UITextField) {
        item.text = "+7"
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
