//
//  DestinationDetailScreenView.swift
//  35. SwiftUI Travel App
//
//  Created by Sesili Tsikaridze on 14.12.23.
//

import SwiftUI

struct DestinationDetailScreenView: View {
    var city: Destination
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: city.image)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame( height: 200)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .clipped()
                        .shadow(radius: 2)
                case .failure:
                    Text("Image not found")
                case .empty:
                    Text("Loading...")
                        .padding(.bottom, 20)
                @unknown default:
                    Text("Loading...")
                }
            }
            .padding(.top, 20)
            
            DescriptionTextView(city: city)
            
            Spacer()
            
            ButtonsView(city: city)
            
        }
        .padding(20)
    }
}

//MARK: - Separate Views

struct DescriptionTextView: View {
    var city: Destination
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundStyle(Color.textDarkGray)
                Text("\(city.name), \(city.country)")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.cyan)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            
            Text(city.description)
            
        }
    }
}

struct ButtonsView: View {
    var city: Destination
    
    var body: some View {
        VStack() {
            NavigationLink(value: city.mustSeePlaces) {
                Text("Must See")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.cyan)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .clipped()
            }
            .navigationDestination(for: [MustSeePlace].self) { places in
                VStack {
                    MustSeeScreenView(mustSeePlaces: places)
                }
            }
            
            
            HStack {
                NavigationLink(value: city.transport) {
                    Text("Transport")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .clipped()
                }
                .navigationDestination(for: Transport.self) { transport in
                    VStack {
                        TransportView(cityTransport: transport)
                    }
                }
                
                NavigationLink(value: city.hotels) {
                    Text("Hotels")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .clipped()
                }
                .navigationDestination(for: [Hotel].self) { hotel in
                    VStack {
                        HotelsView(hotels: hotel)
                    }
                }
                
            }
        }
        .font(.system(size: 16, weight: .bold))
        .buttonStyle(BorderlessButtonStyle())
        .foregroundStyle(.white)
        .padding(.vertical, 30)
    }
}

