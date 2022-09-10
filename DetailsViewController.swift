//
//  DetailsViewController.swift
//  TeamApp
//
//  Created by MacBook Pro on 10.09.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet var imageDeveloper: UIImageView!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelWork: UILabel!
    
    
    var info: Developer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDeveloper.image = UIImage(named: info.name)
        labelWork.text = info.work
        labelName.text = info.fullName
    }
    

   
   
}
