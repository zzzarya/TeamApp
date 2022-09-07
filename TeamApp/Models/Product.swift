//
//  File.swift
//  TeamApp
//
//  Created by Антон Заричный on 06.09.2022.
//

import Foundation

struct Product {
    let productType: ProductType
    let name: String
    let size: Size
    let description: String
    let image: String
}

enum ProductType {
    case pizza
    case coffe
}

enum Size {
    case small
    case medium
    case large
}

extension Product {
    func getProductPizza() -> [Product] {
        var pizzas: [Product] = []
        
        let sharedPizza = DataManager.sharedPizza
        for index in 0..<sharedPizza.names.count {
            let pizza = Product(productType: .pizza,
                                name: sharedPizza.names[index],
                                size: .medium,
                                description: sharedPizza.descriptions[index],
                                image: sharedPizza.names[index])
            pizzas.append(pizza)
        }
        
        return pizzas
    }
}

