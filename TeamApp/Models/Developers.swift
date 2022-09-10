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
        [ Developer(name: "Svyatoslav", surname: "Nesterov", work: "Info"), Developer(name: "Anton", surname: "Zarichniy", work: "StoryBoard")]
            
        
        
    }
}
