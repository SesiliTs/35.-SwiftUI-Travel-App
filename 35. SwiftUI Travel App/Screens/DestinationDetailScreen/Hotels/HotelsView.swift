//
//  HotelsView.swift
//  35. SwiftUI Travel App
//
//  Created by Sesili Tsikaridze on 14.12.23.
//

import SwiftUI

struct HotelsView: View {
    var city: Destination

    var body: some View {
        VStack(alignment: .leading) {
            Text("HOTEL SUGGESTIONS IN \(city.name.uppercased()) 🏘️")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.cyan)
                .padding(.bottom, 30)
                ForEach(city.hotels, id: \.name) { hotel in
                    VStack(alignment: .leading) {
                        HStack {
                            Text(hotel.name)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.textDarkGray)
                            Spacer()
                            Text(hotel.priceRange)
                                .foregroundStyle(.gray)
                                .font(.system(size: 14))
                        }
                        .padding(.bottom, 20)
                        Link("Visit Hotel Website", destination: URL(string: hotel.link)!)
                            .font(.system(size: 14, weight: .light))
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 2)
            Spacer()
            
        }
        .padding(20)
    }
}

#Preview {
    MainScreenView()
}
