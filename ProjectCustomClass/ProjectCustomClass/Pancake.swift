//
//  Pancake.swift
//  ProjectCustomClass
//
//  Created by Алтын on 9/24/20.
//

import Foundation

class Pancake {
    var name: String
    var filling: String
    var topping: String
    
    
    init() {
        self.name = "Dunno"
        self.filling = "Surprise me"
        self.topping = "Surprise me"
    }

    init(name: String, filling: String, topping: String) {
        self.name = name
        self.filling = filling
        self.topping = topping
    }
}
