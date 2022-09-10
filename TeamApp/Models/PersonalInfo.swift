//
//  PersonalInfo.swift
//  TeamApp
//
//  Created by Илья on 08.09.2022.
//

struct Person {
    var name: String
    var password: String
    var numberPhone: String
    var email: String
    var avatar: String
    var address: String
    }

extension Person {
    static func getPerson() -> Person {
        Person(name: "Robert",
               password: "1234",
               numberPhone: "12345678911",
               email: "qwe@gmail.com",
               avatar: "avatarMan",
               address: "Izhevsk")
}
}
