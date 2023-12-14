//
//  TransportView.swift
//  35. SwiftUI Travel App
//
//  Created by Sesili Tsikaridze on 14.12.23.
//

import SwiftUI

struct TransportView: View {
    var cityTransport: Transport

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Transportation Systems 🚗")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.cyan)
            Text("mostly used transportation methods are: \(cityTransport.system)")
            Text("Average Prices 💸")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.cyan)
            Text("Bus and Tram Tickets: \(cityTransport.averagePrices?.busTramTicket?.description ?? "") €")
            Text("Metro Tickets: \(cityTransport.averagePrices?.metroTicket?.description ?? "") €")
            Spacer()
            Image(.transport)
                .resizable()
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .clipped()
                .overlay(alignment: .bottom) {
                    HomePageButton()
                }
        }
        .padding(20)
    }
}
