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

enum Size: String {
    case smallPizza = "Маленькая 25 см, традиционное тесто, 330 г"
    case mediumPizza = "Средняя 30 см, традиционное тесто, 500 г"
    case largePizza = "Большая 35 см, традиционное тесто, 670 г"
    
    case smallCoffe = "0,3 л"
    case mediumCoffe = "0,4 л"
    case largeCoffe = "0,5 л"
}

enum Price: Int {
        case smallPizzaPrice = 299
        case mediumPizzaPrice = 399
        case largePizzaPrice = 499

        case smallCoffePrice = 99
        case mediumCoffePrice = 129
        case largeCoffePrice = 159
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
                        Characteristics(size: .smallPizza, price: .smallPizzaPrice),
                        Characteristics(size: .mediumPizza, price: .mediumPizzaPrice),
                        Characteristics(size: .largePizza, price: .largePizzaPrice)
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
                        Characteristics(size: .smallCoffe, price: .smallCoffePrice),
                        Characteristics(size: .mediumCoffe, price: .mediumCoffePrice),
                        Characteristics(size: .largeCoffe, price: .largeCoffePrice)
                    ]
                )
                products.append(coffee)
            }
        }
        
        return products
    }
}

