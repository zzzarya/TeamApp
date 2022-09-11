//
//  LoginViewController.swift
//  TeamApp
//
//  Created by Илья on 08.09.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingBottom(for: loginButton)
    }
    
    private func settingBottom(for item: UIButton) {
        item.layer.cornerRadius = 20
        item.backgroundColor = .systemBlue
    }
}
