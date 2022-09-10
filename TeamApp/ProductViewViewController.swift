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
        setupCharacteristicsProductLabel()
        setupSizeProductSegment()
    }
    
    @IBAction func sizeProductSegmentPressed() {
        
        switch product.productType {
        case .pizza:
            switch sizeProductSegment.selectedSegmentIndex {
            case 0:
                characteristicsProductLabel.text = "Маленькая 25 см, традиционное тесто, 330 г"
                buttonToBasket.setTitle("В корзину за 299 р", for: .normal)
            case 1:
                characteristicsProductLabel.text = "Средняя 30 см, традиционное тесто, 500 г"
                buttonToBasket.setTitle("В корзину за 399 р", for: .normal)
            default:
                characteristicsProductLabel.text = "Большая 35 см, традиционное тесто, 670 г"
                buttonToBasket.setTitle("В корзину за 499 р", for: .normal)
            }
            
        default:
            switch sizeProductSegment.selectedSegmentIndex {
            case 0:
                characteristicsProductLabel.text = "0,3 л"
                buttonToBasket.setTitle("В корзину за 99 р", for: .normal)
            case 1:
                characteristicsProductLabel.text = "0,4 л"
                buttonToBasket.setTitle("В корзину за 129 р", for: .normal)
            default:
                characteristicsProductLabel.text = "0,5 л"
                buttonToBasket.setTitle("В корзину за 159 р", for: .normal)
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
        buttonToBasket.setTitleColor(.white, for: .normal)
        
        switch product.productType {
        case .pizza:
            buttonToBasket.setTitle("В корзину за 299 р", for: .normal)
        default:
            buttonToBasket.setTitle("В корзину за 99 р", for: .normal)
        }
    }
}

extension ProductViewViewController {
    func setupCharacteristicsProductLabel() {
        switch product.productType {
        case .pizza:
            characteristicsProductLabel.text = "Маленькая 25 см, традиционное тесто, 330 г"
        default:
            characteristicsProductLabel.text = "0,3 л"
        }
    }
}

extension ProductViewViewController {
    func setupSizeProductSegment() {
        switch product.productType {
        case .pizza:
            sizeProductSegment.setTitle("Маленькая", forSegmentAt: 0)
            sizeProductSegment.setTitle("Средняя", forSegmentAt: 1)
            sizeProductSegment.setTitle("Большая", forSegmentAt: 2)
        default:
            sizeProductSegment.setTitle("Маленький", forSegmentAt: 0)
            sizeProductSegment.setTitle("Средний", forSegmentAt: 1)
            sizeProductSegment.setTitle("Большой", forSegmentAt: 2)
        }
    }
}
