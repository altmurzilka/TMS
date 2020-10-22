//
//  UserSettings.swift
//  ProjectRace
//
//  Created by Алтын on 10/22/20.
//

import Foundation

class UserSettings{
    
    let nickname: String
    let vehicleColor: String
    let obstacleType: String
    
    init(nickname: String, vehicleColor: String, obstacleType: String) {
        self.nickname = nickname
        self.vehicleColor = vehicleColor
        self.obstacleType = obstacleType
    }
}
