//
//  ProudctViewViewController.swift
//  TeamApp
//
//  Created by Антон Заричный on 10.09.2022.
//

import UIKit

class ProductViewViewController: UIViewController {
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var characteristicsProductLabel: UILabel!
    @IBOutlet var descriptionProductLabel: UILabel!
    @IBOutlet var sizeProductSegment: UISegmentedControl!
    @IBOutlet var buttonToBasketPressed: UIButton!
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productNameLabel.text = product.name
        productImageView.image = UIImage(named: product.image)
        descriptionProductLabel.text = product.description

        setupButton()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ProductViewViewController {
    func setupButton() {
        buttonToBasketPressed.backgroundColor = .orange
        buttonToBasketPressed.layer.cornerRadius = 12
        buttonToBasketPressed.setTitle("В корзину за 1 р", for: .normal)
        buttonToBasketPressed.setTitleColor(.white, for: .normal)
    }
}
