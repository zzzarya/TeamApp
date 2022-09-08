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
    let description: String
    let image: String
    static var size: Size?
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
    static func getProductList(product: ProductType) -> [Product] {
        var products: [Product] = []
        
        if product == .pizza {
            let pizzaNames = DataManager.Pizza.sharedPizza.names
            let pizzaDescriptions = DataManager.Pizza.sharedPizza.descriptions
            
            let numberOfIterations = min(pizzaNames.count, pizzaDescriptions.count)
            
            for iteration in 0..<numberOfIterations {
                let pizza = Product(
                    productType: .pizza,
                    name: pizzaNames[iteration],
                    description: pizzaDescriptions[iteration],
                    image: pizzaNames[iteration])
                products.append(pizza)
            }
        } else {
            let coffeNames = DataManager.Coffee.sharedCoffee.names
            let coffeDescriptions = DataManager.Coffee.sharedCoffee.descriptions
            
            let numberOfIterations = min(coffeNames.count, coffeDescriptions.count)
            
            for iteration in 0..<numberOfIterations {
                
                let coffee = Product(
                    productType: .pizza,
                    name: coffeNames[iteration],
                    description: coffeDescriptions[iteration],
                    image: coffeNames[iteration])
                products.append(coffee)
            }
        }
        
        return products
    }
}
