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
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Developer {
    static func getInfo() -> [Developer] {
        [  Developer(name: "Anton", surname: "Zarichniy", work: "Team lead"), Developer(name: "Bogdan", surname: "Anishenkov", work: "A"), Developer(name: "Karina", surname: "Krasnogorskaya", work: "C"), Developer(name: "Ilya", surname: "Sobin", work: "B"), Developer(name: "Ruslan", surname: "Belov", work: "D"), Developer(name: "Svyatoslav", surname: "Nesterov", work: "Info"),]
            
        
        
    }
}
