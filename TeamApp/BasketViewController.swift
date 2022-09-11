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
}


extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "product", for: indexPath) as! BasketTableViewCell

        return cell
    }


}
