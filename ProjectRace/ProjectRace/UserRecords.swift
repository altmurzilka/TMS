//
//  UserRecords.swift
//  ProjectRace
//
//  Created by Алтын on 11/2/20.
//

import Foundation

class UserRecords: Codable {
    
    let nickname: String
    let score: Int
    let date: Date
    
    init(nickname: String, score: Int, date: Date) {
        self.nickname = nickname
        self.score = score
        self.date = date
    }
    
    public enum CodingKeys: String, CodingKey {
        case nickname, score, date
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.nickname = try container.decode(String.self, forKey: .nickname)
        self.score = try container.decode(Int.self, forKey: .score)
        self.date = try container.decode(Date.self, forKey: .date)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(self.nickname, forKey: .nickname)
        try container.encode(self.score, forKey: .score)
        try container.encode(self.date, forKey: .date)
    }
    
}

