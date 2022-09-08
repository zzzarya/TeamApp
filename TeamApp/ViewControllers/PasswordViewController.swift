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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingBottom(for: nextButton)
    }
    

    @IBAction func checkButton() {
        
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
    
}
