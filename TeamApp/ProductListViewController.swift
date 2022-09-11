//
//  ProductListViewController.swift
//  TeamApp
//
//  Created by Bogdan Anishchenkov on 08.09.2022.
//

import UIKit

protocol ProductViewViewControllerDelegate {
    func addProduct(some productToBasket: Product) -> [Product]
}

class ProductListViewController: UITableViewController {
    var productsToBasket: [Product] = []
    
    let pizza = Product.getProductList(product: .pizza)
    let coffee = Product.getProductList(product: .coffe)
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return pizza.count
        } else {
            return coffee.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "product", for: indexPath)
        
        if indexPath.section == 0 {
            let product = pizza[indexPath.row]
            
            var content = cell.defaultContentConfiguration()
            content.text = product.name
            content.image = UIImage(named: product.name)
            content.secondaryText = product.description
            
            cell.contentConfiguration = content
        } else {
            let product = coffee[indexPath.row]
            
            var content = cell.defaultContentConfiguration()
            content.text = product.name
            content.image = UIImage(named: product.name)
            content.secondaryText = product.description
            
            cell.contentConfiguration = content
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Пицца"
        } else {
            return "Кофе"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        header.textLabel?.frame = header.bounds
        header.textLabel?.textAlignment = .left
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
     // MARK: - Navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let productViewVC = segue.destination as? ProductViewViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else { return }
        
        productViewVC.delegate = self
        
        var product: Product!
        
        if index.section == 0 {
            product = pizza[index.row]
        } else {
            product = coffee[index.row]
        }
        productViewVC.product = product
        
    }
    
    private func passProductsToTabBarVC() {
        guard let lastNavVC = tabBarController?.viewControllers?.last as? UINavigationController else { return }
        guard let basketVC = lastNavVC.topViewController as? BasketViewController else { return }
        basketVC.productsInBasket = productsToBasket
    }
}

extension ProductListViewController: ProductViewViewControllerDelegate {
    func addProduct(some productToBasket: Product) -> [Product] {
        productsToBasket.append(productToBasket)
        passProductsToTabBarVC()
        return productsToBasket
    }
    
    
}
