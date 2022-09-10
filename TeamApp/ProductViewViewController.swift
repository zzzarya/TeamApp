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
    @IBOutlet var buttonToBasket: UIButton!
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(product)
        
        productNameLabel.text = product.name
        productImageView.image = UIImage(named: product.image)
        descriptionProductLabel.text = product.description
        

        setupButton()
    }
    
    @IBAction func sizeProductSegmentPressed() {
        
        switch product.productType {
        case .pizza:
            switch sizeProductSegment.selectedSegmentIndex {
            case 0:
                buttonToBasket.setTitle("В корзину за 299", for: .normal)
            case 1:
                buttonToBasket.setTitle("В корзину за 399", for: .normal)
            default:
                buttonToBasket.setTitle("В корзину за 499", for: .normal)
            }
            
        default:
            switch sizeProductSegment.selectedSegmentIndex {
            case 0:
                buttonToBasket.setTitle("В корзину за 99", for: .normal)
            case 1:
                buttonToBasket.setTitle("В корзину за 129", for: .normal)
            default:
                buttonToBasket.setTitle("В корзину за 159", for: .normal)
            }
        }
    }
    
    @IBAction func buttonToBasketPressed(_ sender: Any) {
        
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
        buttonToBasket.backgroundColor = .orange
        buttonToBasket.layer.cornerRadius = 12
        buttonToBasket.setTitle("В корзину за 1 р", for: .normal)
        buttonToBasket.setTitleColor(.white, for: .normal)
        
        switch product.productType {
        case .pizza:
            buttonToBasket.setTitle("В корзину за 299", for: .normal)
        default:
            buttonToBasket.setTitle("В корзину за 99", for: .normal)
        }
    }
}
