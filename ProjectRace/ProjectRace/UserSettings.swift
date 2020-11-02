//
//  UserSettings.swift
//  ProjectRace
//
//  Created by Алтын on 10/22/20.
//

import Foundation

class UserSettings: Codable {
    
    let nickname: String
    let vehicleColor: String
    let obstacleType: String
    
    init(nickname: String, vehicleColor: String, obstacleType: String) {
        self.nickname = nickname
        self.vehicleColor = vehicleColor
        self.obstacleType = obstacleType
    }
    
    public enum CodingKeys: String, CodingKey {
        case nickname, vehicleColor, obstacleType
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.nickname = try container.decode(String.self, forKey: .nickname)
        self.vehicleColor = try container.decode(String.self, forKey: .vehicleColor)
        self.obstacleType = try container.decode(String.self, forKey: .obstacleType)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(self.nickname, forKey: .nickname)
        try container.encode(self.vehicleColor, forKey: .vehicleColor)
        try container.encode(self.obstacleType, forKey: .obstacleType)
    }
    
}


