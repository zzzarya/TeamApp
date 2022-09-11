//
//  BasketTableViewCell.swift
//  TeamApp
//
//  Created by Белов Руслан on 11.09.2022.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productSubTitle: UILabel!
    @IBOutlet weak var productCost: UILabel!
    @IBOutlet weak var productTrashBasket: UIButton!
    @IBOutlet weak var productCount: UITextField!
    @IBOutlet weak var productPlusAndMinus: UIStepper!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


