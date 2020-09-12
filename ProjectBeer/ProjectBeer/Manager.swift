//
//  Manager.swift
//  ProjectBeer
//
//  Created by Алтын on 9/11/20.
//

import Foundation

class Manager {
    
    static let shared = Manager()
    
    private init() {}
    
    func beer(quantity: Int) -> Int {
        var sum = 0
        sum += quantity
        return sum
    }
    
    // Проверка выручки в конце дня || Продажа
    func sell(total1: Int, total2: Int, total3: Int) -> String {
        return "\(total1 + total2 + total3)"
    }
    
    // проверка остатков || закрытие дня
    func newShift(beer1: Int, beer2: Int, beer3: Int) -> String {
        return "Hobgoblin - \(100 - beer1), Fuller's - \(100 - beer2), Hacker-Pschorr - \(100 - beer3)"
    }
    
    // начало новой смены - обнуление выручки || новый день
    func quantity(b1: Int, b2: Int, b3: Int) -> (Int, Int, Int) {
        return (100, 100, 100)
    }
}
