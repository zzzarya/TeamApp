//
//  TabBarViewController.swift
//  TeamApp
//
//  Created by Bogdan Anishchenkov on 11.09.2022.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var productsToBasket = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func passProducts() {
        guard let lastNavigationVC = viewControllers?.last as? UINavigationController else { return }
        guard let basketVC = lastNavigationVC.viewControllers.first as? BasketViewController else { return }
        basketVC.productsInBasket = productsToBasket
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
