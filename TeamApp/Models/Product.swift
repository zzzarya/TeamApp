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

