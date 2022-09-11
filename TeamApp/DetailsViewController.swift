//
//  DetailsViewController.swift
//  TeamApp
//
//  Created by MacBook Pro on 10.09.2022.
//

import UIKit

class DetailsViewController: UIViewController {
   
   
    var info: Developer!
    @IBOutlet var imageDeveloper: UIImageView!
    
    @IBOutlet var labelContact: UILabel!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelWork: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageDeveloper.image = UIImage(named: info.name)
        labelContact.text = info.contact
        labelName.text = info.fullName
        labelWork.text = info.work
        
        
        imageDeveloper.layer.cornerRadius = imageDeveloper.frame.width / 2
        imageDeveloper.clipsToBounds = true
       
    }
    

   
   
}

