//
//  MustSeeScreenView.swift
//  35. SwiftUI Travel App
//
//  Created by Sesili Tsikaridze on 14.12.23.
//

import SwiftUI

struct MustSeeScreenView: View {
    var mustSeePlaces: [MustSeePlace]
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(mustSeePlaces, id: \.name) { place in
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
                                .padding(.bottom, 50)
                        @unknown default:
                            Text("Loading...")
                        }
                    }
                    
                    placeDescriptionView(place: place)
                }
                .padding()
            }
            
            Spacer()
            
            HomePageButton()
        }
        .padding(20)
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
}
