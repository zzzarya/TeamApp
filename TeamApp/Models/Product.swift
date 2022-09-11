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
    let characteristics: [Characteristics]
}

struct Characteristics {
    let size: Size
    let price: Price
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

enum Price: String {
        case smallPizzaPrice = "299 рублей"
        case mediumPizzaPrice = "399 рублей"
        case largePizzaPrice = "499 рублей"

        case smallCoffePrice = "99 рублей"
        case mediumCoffePrice = "129 рублей"
        case largeCoffePrice = "159 рублей"
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
                    image: pizzaNames[iteration],
                    characteristics: [
                        Characteristics(size: .small, price: .smallPizzaPrice),
                        Characteristics(size: .medium, price: .mediumPizzaPrice),
                        Characteristics(size: .large, price: .largePizzaPrice)
                    ]
                )
                products.append(pizza)
            }
        } else {
            let coffeNames = DataManager.Coffee.sharedCoffee.names
            let coffeDescriptions = DataManager.Coffee.sharedCoffee.descriptions
            
            let numberOfIterations = min(coffeNames.count, coffeDescriptions.count)
            
            for iteration in 0..<numberOfIterations {
                let coffee = Product(
                    productType: .coffe,
                    name: coffeNames[iteration],
                    description: coffeDescriptions[iteration],
                    image: coffeNames[iteration],
                    characteristics: [
                        Characteristics(size: .small, price: .smallCoffePrice),
                        Characteristics(size: .medium, price: .mediumCoffePrice),
                        Characteristics(size: .large, price: .largeCoffePrice)
                    ]
                )
                products.append(coffee)
            }
        }
        
        return products
    }
}

