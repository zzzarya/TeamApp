//
//  ProfileViewController.swift
//  TeamApp
//
//  Created by Илья on 08.09.2022.
//

import UIKit

protocol SaveInfoDelegate {
    func setInfo(_ sender: Person)
}

class ProfileViewController: UIViewController {

    @IBOutlet var avatarView: UIImageView!
    @IBOutlet var telphoneTable: UILabel!
    @IBOutlet var emalTable: UILabel!
    @IBOutlet var adresTable: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        getProfil(person)
        getPerson(person)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingVC = navigationVC.topViewController as? SettingViewController else { return }
        settingVC.delegat = self
        settingVC.person = person
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func getProfil(_ sender: Person) {
        avatarView.image = UIImage(named: sender.avatar)
        telphoneTable.text = sender.numberPhone
        emalTable.text = sender.email
        adresTable.text = sender.address
        
        navigationItem.title = sender.name
    }
    
    private func getPerson(_ sender: Person) {
        person.name = sender.name
        person.numberPhone = sender.numberPhone
        person.email = sender.email
        person.avatar = sender.avatar
        person.address = sender.address
        
        getProfil(person)
    }

}

extension ProfileViewController: SaveInfoDelegate {
    func setInfo(_ sender: Person) {
        getProfil(sender)
        getPerson(sender)
    }
}
