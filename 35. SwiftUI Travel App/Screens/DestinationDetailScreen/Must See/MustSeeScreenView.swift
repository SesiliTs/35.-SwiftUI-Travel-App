//
//  MustSeeScreenView.swift
//  35. SwiftUI Travel App
//
//  Created by Sesili Tsikaridze on 14.12.23.
//

import SwiftUI

struct MustSeeScreenView: View {
    var city: Destination

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ScrollView {
                ForEach(city.mustSeePlaces, id: \.name) { place in
                    AsyncImage(url: URL(string: place.image)) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame( height: 200)
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .clipped()
                        case .failure:
                            Text("Image not found")
                        case .empty:
                            Text("Loading...")
                                .padding(.bottom, 20)
                        @unknown default:
                            Text("Loading...")
                        }
                    }

                    placeDescriptionView(place: place)
                }
            }
            
            Spacer()
            
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
        .padding(.horizontal, 20)
        .padding(.top, 30)
    }
}

struct placeDescriptionView: View {
    var place: MustSeePlace
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundStyle(Color.textDarkGray)
                Text(place.name)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.cyan)
                Spacer()
            }
            
            Text(place.description)
                .font(.system(size: 14))
                .foregroundStyle(.textDarkGray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.top, -40)
    }
}

//#Preview {
//    MustSeeScreenView(city: Destination.init(id: 12, name: "Tbilisi", country: "Georgia", description: "Tbilisi is a capital of Georgia skdj kjfkjsklaop fbjksad lsdm kfnnla ;sk lflm", activities: ["hiking", "sightseeing"], image: "https://storage.georgia.travel/images/tbilisi-capital-of-georgia-country.webp", mustSeePlaces: [.init(name: "narikala fortress", description: "lkdnf ljwiubsxnk feflkn jaksblfn gokiropj jkndkjabf wbhjk  nmvspo o oj mf", image: "https://storage.georgia.travel/images/tbilisi-capital-of-georgia-country.webp")], transport: .init(system: "ragac", averagePrices: .init(metroTicket: 2.5, busTramTicket: 2.3)), hotels: .none))
//}

