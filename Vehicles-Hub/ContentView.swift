//
//  ContentView.swift
//  Vehicles-Hub
//
//  Created by Ahmad Amjad on 26/06/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vehicleViewModel = VehicleViewModel()
    @State private var searchText = ""
    @State private var selectedVehicle: Vehicle?
    
    var filteredVehicles: [Vehicle] {
            if searchText.isEmpty {
                return vehicleViewModel.vehicles
            } else {
                return vehicleViewModel.vehicles.filter { $0.makeName.localizedCaseInsensitiveContains(searchText) }
            }
        }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    List {
                        ForEach(filteredVehicles) { vehicle in
                            VStack(alignment: .leading) {
                                Text(vehicle.makeName)
                                    .font(.headline)
                                Text(vehicle.mfrName)
                                    .font(.subheadline)
                            }
                            .onTapGesture {
                                selectedVehicle = vehicle
                            }
                        }
                    }
                    .opacity(vehicleViewModel.isLoading ? 0 : 1)
                    
                    if vehicleViewModel.isLoading {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                }
            }
            .navigationTitle("Vehicles")
            .searchable(text: $searchText,prompt: "Search")
            .sheet(item: $selectedVehicle) { vehicle in
                    VehicleDetailView(vehicle: vehicle)
                }
        }
    }
}

#Preview {
    ContentView()
}


