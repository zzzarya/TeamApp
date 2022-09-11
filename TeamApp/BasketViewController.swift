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
        print(productsInBasket)
        super.viewDidLoad()
        BasketTableView.dataSource = self
        BasketTableView.register(UINib(nibName: "BasketTableViewCell", bundle: nil), forCellReuseIdentifier: "product")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.BasketTableView.reloadData()
    }
}


extension BasketViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsInBasket.count
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
