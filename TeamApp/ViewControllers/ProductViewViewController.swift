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
    var productToBasket: Product!
    
    var delegate: ProductViewViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productNameLabel.text = product.name
        productImageView.image = UIImage(named: product.image)
        descriptionProductLabel.text = product.description
        
        setupButton()
        setupCharacteristicsProductLabel()
        setupSizeProductSegment()
    }
    
    private func chooseProduct() -> Product {
        var productInBasket: Product
        
        switch sizeProductSegment.selectedSegmentIndex {
        case 0:
            productInBasket = Product(productType: product.productType,
                                      name: product.name,
                                      description: product.description,
                                      image: product.image,
                                      characteristics: [product.characteristics[0]])
            
        case 1:
            productInBasket = Product(productType: product.productType,
                                      name: product.name,
                                      description: product.description,
                                      image: product.image,
                                      characteristics: [product.characteristics[1]])
            
        default:
            productInBasket = Product(productType: product.productType,
                                      name: product.name,
                                      description: product.description,
                                      image: product.image,
                                      characteristics: [product.characteristics[2]])
        }
        
        return productInBasket
    }

    
    @IBAction func sizeProductSegmentPressed() {
        
        switch product.productType {
        case .pizza:
            switch sizeProductSegment.selectedSegmentIndex {
            case 0:
                characteristicsProductLabel.text = "\(product.characteristics[0].size.rawValue)"
                buttonToBasket.setTitle("В корзину за \(product.characteristics[0].price.rawValue) р", for: .normal)
            case 1:
                characteristicsProductLabel.text = "\(product.characteristics[1].size.rawValue)"
                buttonToBasket.setTitle("В корзину за \(product.characteristics[1].price.rawValue) р", for: .normal)
            default:
                characteristicsProductLabel.text = "\(product.characteristics[2].size.rawValue)"
                buttonToBasket.setTitle("В корзину за \(product.characteristics[2].price.rawValue) р", for: .normal)
            }
            
        default:
            switch sizeProductSegment.selectedSegmentIndex {
            case 0:
                characteristicsProductLabel.text = "\(product.characteristics[0].size.rawValue)"
                buttonToBasket.setTitle("В корзину за \(product.characteristics[0].price.rawValue) р", for: .normal)
            case 1:
                characteristicsProductLabel.text = "\(product.characteristics[1].size.rawValue)"
                buttonToBasket.setTitle("В корзину за \(product.characteristics[1].price.rawValue) р", for: .normal)
            default:
                characteristicsProductLabel.text = "\(product.characteristics[2].size.rawValue)"
                buttonToBasket.setTitle("В корзину за \(product.characteristics[2].price.rawValue) р", for: .normal)
            }
        }
    }
    
    @IBAction func buttonToBasketPressed() {
        productToBasket = chooseProduct()
        delegate.addProduct(some: productToBasket)
        dismiss(animated: true)
    }
    
}

extension ProductViewViewController {
    func setupButton() {
        buttonToBasket.backgroundColor = .orange
        buttonToBasket.layer.cornerRadius = 12
        buttonToBasket.setTitleColor(.white, for: .normal)
        
        switch product.productType {
        case .pizza:
            buttonToBasket.setTitle("В корзину за \(product.characteristics[1].price.rawValue) р", for: .normal)
        default:
            buttonToBasket.setTitle("В корзину за \(product.characteristics[1].price.rawValue) р", for: .normal)
        }
    }
}

extension ProductViewViewController {
    func setupCharacteristicsProductLabel() {
        switch product.productType {
        case .pizza:
            characteristicsProductLabel.text = "\(product.characteristics[1].size.rawValue)"
        default:
            characteristicsProductLabel.text = "\(product.characteristics[1].size.rawValue)"
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
        
        sizeProductSegment.selectedSegmentIndex = 1
    }
}
