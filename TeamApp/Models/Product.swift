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
    static func getProductList(product: ProductType) -> [Product] {
        var products: [Product] = []
        
        if product == .pizza {
            let pizzaNames = DataManager.Pizza.sharedPizza.names
            let pizzaDescriptions = DataManager.Pizza.sharedPizza.descriptions
            
            let numberOfIterations = min(pizzaNames.count, pizzaDescriptions.count)
            
            for iteration in 0..<numberOfIterations {
                
                for size in 0...2 {
                    
                    switch size {
                    case 1:
                        let pizza = Product(
                            productType: .pizza,
                            name: pizzaNames[iteration],
                            size: Size.small,
                            description: pizzaDescriptions[iteration],
                            image: pizzaNames[iteration])
                        products.append(pizza)
                    case 2:
                        let pizza = Product(
                            productType: .pizza,
                            name: pizzaNames[iteration],
                            size: Size.medium,
                            description: pizzaDescriptions[iteration],
                            image: pizzaNames[iteration])
                        products.append(pizza)
                    default:
                        let pizza = Product(
                            productType: .pizza,
                            name: pizzaNames[iteration],
                            size: Size.large,
                            description: pizzaDescriptions[iteration],
                            image: pizzaNames[iteration])
                        products.append(pizza)
                    }
                }
            }
        } else {
            let coffeNames = DataManager.Coffee.sharedCoffee.names
            let coffeDescriptions = DataManager.Coffee.sharedCoffee.descriptions
            
            let numberOfIterations = min(coffeNames.count, coffeDescriptions.count)
            
            for iteration in 1...numberOfIterations {
                
                for size in 1...3 {
                    
                    switch size {
                    case 1:
                        let coffee = Product(
                            productType: .pizza,
                            name: coffeNames[iteration],
                            size: Size.small,
                            description: coffeDescriptions[iteration],
                            image: coffeNames[iteration])
                        products.append(coffee)
                    case 2:
                        let coffee = Product(
                            productType: .pizza,
                            name: coffeNames[iteration],
                            size: Size.medium,
                            description: coffeDescriptions[iteration],
                            image: coffeNames[iteration])
                        products.append(coffee)
                    default:
                        let coffee = Product(
                            productType: .pizza,
                            name: coffeNames[iteration],
                            size: Size.large,
                            description: coffeDescriptions[iteration],
                            image: coffeNames[iteration])
                        products.append(coffee)
                    }
                }
            }
        }
        
        return products
    }
}
