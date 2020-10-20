//
//  Student.swift
//  Project9
//
//  Created by Алтын on 10/20/20.
//

import Foundation

class Student: Codable {
    
    var name: String
    var age: Int?
    var group: String
    
    init(name: String, age: Int, group: String) {
        self.age = age
        self.group = group
        self.name = name
    }
    
    public enum CodingKeys: String, CodingKey {
        case age, name, group
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decodeIfPresent(Int.self, forKey: .age)
        self.group = try container.decode(String.self, forKey: .group)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(self.name, forKey: .name)
        try container.encode(self.age, forKey: .age)
        try container.encode(self.group, forKey: .group)
    }
    
}
