//
//  Student.swift
//  Project3
//
//  Created by Алтын on 9/10/20.
//

import Foundation

class Student {
    
    var name: String
    var age: Int
    var group: String
    var address: Address
    
    init(name: String, age: Int, group: String, address: Address) {
        self.name = name
        self.age = age
        self.group = group
        self.address = address
    }
}
