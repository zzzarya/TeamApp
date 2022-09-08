//
//  PersonalInfo.swift
//  TeamApp
//
//  Created by Илья on 08.09.2022.
//

struct Person {
    let name: String
    let password: String
    let numberPhone: Int
    let email: String
    let avatar: String
    
    func getPerson() -> Person {
        Person(name: "Robert",
               password: "1",
               numberPhone: 79120227130,
               email: "qwe@gmail.com",
               avatar: "avatar")
    }
}
