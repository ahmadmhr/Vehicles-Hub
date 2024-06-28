//
//  VehicleDetailView.swift
//  Vehicles-Hub
//
//  Created by Ahmad Amjad on 27/06/2024.
//

import SwiftUI

struct VehicleDetailView: View {
    let vehicle: Vehicle
    
    var body: some View {
        VStack{
            Text(vehicle.makeName)
                .font(.system(size: 60))
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundStyle(.red)
            Text(vehicle.mfrName)
                .font(.title)
            Spacer()
            Image("car")
                .resizable()
                .frame(width: 200,height: 200)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    VehicleDetailView(vehicle: Vehicle(makeId: 474, makeName: "Honda", mfrId: 987, mfrName: "HONDA MOTOR CO., LTD."))
}
