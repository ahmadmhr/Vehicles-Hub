//
//  Vehicle.swift
//  Vehicles-Hub
//
//  Created by Ahmad Amjad on 26/06/2024.
//

import Foundation

struct VehicleResponse: Codable {
    let count: Int
    let message: String
    let searchCriteria: String
    let results: [Vehicle]
    
    enum CodingKeys: String, CodingKey {
        case count = "Count"
        case message = "Message"
        case searchCriteria = "SearchCriteria"
        case results = "Results"
    }
}

struct Vehicle: Codable, Identifiable, Equatable {
    let id = UUID()
    let makeId: Int
    let makeName: String
    let mfrId: Int
    let mfrName: String
    
    enum CodingKeys: String, CodingKey {
        case makeId = "MakeId"
        case makeName = "MakeName"
        case mfrId = "MfrId"
        case mfrName = "MfrName"
    }
}

