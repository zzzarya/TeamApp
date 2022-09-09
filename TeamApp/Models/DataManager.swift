//
//  DataManager.swift
//  TeamApp
//
//  Created by Антон Заричный on 07.09.2022.
//

import Foundation

class DataManager {
    
    class Pizza {
        static let sharedPizza = Pizza()
        
        let names = ["Сырная", "Пепперони", "Карбонара", "Домашняя", "Мясная",
                     "Цыпленок барбекю", "Гавайская", "Ветчина и грибы", "Ветчина и сыр", "Мясной микс"]
        
        let descriptions = ["Моцарелла, сыры чеддер и пармезан, соус альфредо",
                            "Пикатная пеппрони, увеличенная порция моцареллы, томатный соус",
                            "Бекон, сыры чеддер и пармезан, моцарелла, томаты, красный лук, чеснок, соус альфредо, итальянские травы",
                            "Пикантная пепперони, ветчина, маринованные огурчики, томаты моцарелла, томатный соус",
                            "Цыпленок, ветчина, пикатная пеппрони, острая чоризо, моцарелла, томатный соус",
                            "Цыпленок, бекон, соус барбекю, красный лук, моцарелла, томатный соус",
                            "Ветчина, анансы, моцарелла, томатный соус",
                            "Ветчина, шампиньоны, увеличенная порция моцареллы, томатный соус",
                            "Ветчина, моцарелла, соус альфрредо",
                            "Пастрами из индейки, острая чоризо, пикантная пепперони, бекон, моцарелла, томатный соус"]
    }
    
    class Coffee {
        static let sharedCoffee = Coffee()

        let names = ["Американо", "Капучино", "Латте"]
        
        let descriptions = ["Пара глотков горячего Американо и вы будете готовы покорять этот день",
                            "Король среди кофейных напитков - классический капучино. Для любителей сбалансированного ковейно-молочного вкуса",
                            "Когда хочется нежную молочную пенку, на помощь приходит классический латте"]
    }
    
    private init() {}
}
