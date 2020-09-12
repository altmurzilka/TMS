//
//  Beer.swift
//  ProjectBeer
//
//  Created by Алтын on 9/11/20.
//

import Foundation

class Beer {
    
    var label: String
    var price: Int
    var country: String
    var quantity: Int
    
    init(label: String, price: Int, country: String, quantity: Int) {
        self.label = label
        self.price = price
        self.country = country
        self.quantity = quantity
    }
}
