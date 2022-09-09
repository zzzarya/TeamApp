//
//  PaymentViewController.swift
//  TeamApp
//
//  Created by Карина on 09.09.2022.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var payLabel: UIButton!
    

    @IBOutlet var frontDoorTF: UITextField!
    @IBOutlet var intercomTF: UITextField!
    @IBOutlet var flatTF: UITextField!
    @IBOutlet var floorTF: UITextField!
    @IBOutlet var commentTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        payLabel.layer.cornerRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
        
    @IBAction func payButton(_ sender: Any) {
        if frontDoorTF.text == "" || intercomTF.text == "" || flatTF.text == "" ||
        floorTF.text == "" || commentTF.text == "" || phoneTF.text == "" {
            showAlert(
                title: "Вы ввели не все данные",
                message: "Заполните все поля, чтобы мы приняли заказ"
            )
        } else {
            showAlert(
                title: "Ваш заказ принят",
                message: "Ожидайте курьера"
            )
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
