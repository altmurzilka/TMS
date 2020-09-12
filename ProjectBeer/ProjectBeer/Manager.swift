//
//  Manager.swift
//  ProjectBeer
//
//  Created by Алтын on 9/11/20.
//

import Foundation

class Manager {
    
    var beer1 = Beer(label: "Hobgoblin", price: 2800, country: "England", quantity: 100)
    var beer2 = Beer(label: "Fuller's", price: 3000, country: "England", quantity: 100)
    var beer3 = Beer(label: "Hacker-Pschorr", price: 3200, country: "Germany", quantity: 100)
    
    static let shared = Manager()
    var checking: Bool = false
    
    private init() {}
    
    // Проверка выручки в конце дня || Продажа
    func sell(quantity1: Int, quantity2: Int, quantity3: Int) -> String {
        checking = true
        beer1.quantity = beer1.quantity - quantity1
        beer2.quantity = beer2.quantity - quantity2
        beer3.quantity = beer3.quantity - quantity3
        print("\(beer1.label) - \(quantity1 * beer1.price)")
        print("\(beer2.label) - \(quantity2 * beer2.price)")
        print("\(beer3.label) - \(quantity3 * beer3.price)")
        return "\(quantity1 * beer1.price + quantity2 * beer2.price + quantity3 * beer3.price)"
    }
    
    // проверка остатков || закрытие
    func newShift(remnant1: Int, remnant2: Int, remnant3: Int) -> String {
        if checking == false {
            return "\(beer1.label) - \(beer1.quantity), \(beer2.label) - \(beer2.quantity), \(beer3.label) - \(beer3.quantity)"
        } else {
            checking.toggle()
            beer1.quantity = beer1.quantity - remnant1
            beer2.quantity = beer2.quantity - remnant2
            beer3.quantity = beer3.quantity - remnant3
            return "\(beer1.label) - \(beer1.quantity), \(beer2.label) - \(beer2.quantity), \(beer3.label) - \(beer3.quantity)"
        }
    }
    
    // начало новой смены - обнуление выручки || новый день
    func restoreQuantity() {
        beer1.quantity = 100
        beer2.quantity = 100
        beer3.quantity = 100
    }
}
