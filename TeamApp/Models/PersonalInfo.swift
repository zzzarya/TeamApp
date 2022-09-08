//
//  PersonalInfo.swift
//  TeamApp
//
//  Created by Илья on 08.09.2022.
//

struct Person {
    let name: String
    let password: String
    let numberPhone: String
    let email: String
    let avatar: String
    }

extension Person {
    static func getPerson() -> Person {
        Person(name: "Robert",
               password: "1234",
               numberPhone: "+79120227130",
               email: "qwe@gmail.com",
               avatar: "avatar")
}
}
