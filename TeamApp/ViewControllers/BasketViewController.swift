//
//  BasketViewController.swift
//  TeamApp
//
//  Created by Белов Руслан on 10.09.2022.
//

import UIKit

class BasketViewController: UIViewController {
    @IBOutlet weak var countAndCost: UILabel!
    @IBOutlet weak var makeAnOrder: UIButton!
    @IBOutlet weak var BasketTableView: UITableView!
    
    var productsInBasket: [Product]!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        BasketTableView.dataSource = self
        BasketTableView.register(UINib(nibName: "BasketTableViewCell", bundle: nil), forCellReuseIdentifier: "product")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        setupCountAndCost()
        setupButton()
        
        self.BasketTableView.reloadData()
    }
    
    @IBAction func makeAnOrderButtonPressed() {
        if productsInBasket == nil {
            showAlert()
        }
    }
    
}




extension BasketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if productsInBasket == nil {
            return 0
        } else {
            return productsInBasket.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "product", for: indexPath) as! BasketTableViewCell
        let productInBasket = productsInBasket[indexPath.row]
        
        cell.productImage.image = UIImage(named: productInBasket.image)
        cell.productCost.text = "\(productInBasket.characteristics[0].price.rawValue) рублей"
        cell.productTitle.text = productInBasket.name
        cell.productSubTitle.text = productInBasket.characteristics[0].size.rawValue
        
        return cell
    }
}

extension BasketViewController {
    private func setupButton() {
        makeAnOrder.setTitle("Оформить заказ на \(returnSum()) ₽", for: .normal)
        makeAnOrder.backgroundColor = .orange
        makeAnOrder.layer.cornerRadius = 12
        makeAnOrder.setTitleColor(.white, for: .normal)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Упс!", message: "Корзина пуста", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}

extension BasketViewController {
    func setupCountAndCost() {
        
        if productsInBasket != nil {
            countAndCost.text = "\(productsInBasket.count) товаров на сумму \(returnSum()) ₽"
        }
    }
}

extension BasketViewController {
    func returnSum() -> Int {
        var sum = 0
        if productsInBasket != nil {
            for product in productsInBasket {
                sum += product.characteristics[0].price.rawValue
            }
        }
        return sum
    }
}
