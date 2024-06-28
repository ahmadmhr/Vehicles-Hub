//
//  NetworkManager.swift
//  Vehicles-Hub
//
//  Created by Ahmad Amjad on 27/06/2024.
//

import Foundation
import Combine

class NetworkManager {
    
    func fetchVehicles() -> AnyPublisher<VehicleResponse, Never> {
        guard let url = URL(string: Config.apiURL) else {
            return Just(VehicleResponse(count: 0, message: "", searchCriteria: "", results: []))
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.addValue(Config.apiKey, forHTTPHeaderField: "X-Apihub-Key")
        request.addValue(Config.apiHost, forHTTPHeaderField: "X-Apihub-Host")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: VehicleResponse.self, decoder: JSONDecoder())
            .replaceError(with: VehicleResponse(count: 0, message: "", searchCriteria: "", results: []))
            .eraseToAnyPublisher()
    }
}

