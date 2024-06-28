import Foundation
import Combine

class VehicleViewModel: ObservableObject {
    @Published var vehicles: [Vehicle] = []
    @Published var isLoading: Bool = false
    let networkManager = NetworkManager()
    var cancellable: AnyCancellable?
    
    init() {
        fetchVehicles()
    }
    
    func fetchVehicles() {
        isLoading = true
        
        cancellable = networkManager.fetchVehicles()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] response in
                self?.vehicles = response.results
                self?.isLoading = false
            }
    }
}
