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
            NavigationLink(destination: MustSeeScreenView(city: city)) {
                Text("Must See")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.cyan)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .clipped()
            }
            
            
            HStack {
                NavigationLink(destination: TransportView(city: city)) {
                    Text("Transport")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .clipped()
                }
                
                NavigationLink(destination: HotelsView(city: city)) {
                    Text("Hotels")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .clipped()
                }
                
            }
        }
        .font(.system(size: 16, weight: .bold))
        .buttonStyle(BorderlessButtonStyle())
        .foregroundStyle(.white)
        .padding(.vertical, 30)
    }
}

