//
//  TransportView.swift
//  35. SwiftUI Travel App
//
//  Created by Sesili Tsikaridze on 14.12.23.
//

import SwiftUI

struct TransportView: View {
    var city: Destination

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Transportation Systems 🚗")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.cyan)
            Text("mostly used transportation methods in \(city.name) are: \(city.transport.system)")
            Text("Average Prices 💸")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.cyan)
            Text("Bus and Tram Tickets: \(city.transport.averagePrices?.busTramTicket?.description ?? "") €")
            Text("Metro Tickets: \(city.transport.averagePrices?.metroTicket?.description ?? "") €")
            Spacer()
            Image(.transport)
                .resizable()
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .overlay(alignment: .bottom) {
                    Button("Home Page") {
                        
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.cyan)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .clipped()
                }
        }
        .padding(20)
    }
}
