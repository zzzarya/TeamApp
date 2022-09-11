//
//  Developers.swift
//  TeamApp
//
//  Created by MacBook Pro on 10.09.2022.
//

import Foundation

struct Developer {
    let name: String
    let surname: String
    let work: String
    let contact: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Developer {
    static func getInfo() -> [Developer] {
        [  Developer(name: "Anton", surname: "Zarichniy", work: "Product card", contact: "t.me/zarek9"),
           Developer(name: "Bogdan", surname: "Anishenkov", work: "Menu table", contact: "t.me/diodonne"),
           Developer(name: "Karina", surname: "Krasnogorskaya", work: "Checkout screen", contact: "t.me/krasnogorskaya"),
           Developer(name: "Ilya", surname: "Sobin", work: "Profile", contact: "t.me/sobin_Ilya"),
           Developer(name: "Ruslan", surname: "Belov", work: "Basket", contact: "t.me/S_Svantesson"),
           Developer(name: "Svyatoslav", surname: "Nesterov", work: "Info", contact: "t.me/NeSvyatt")]
            
        
        
    }
}
