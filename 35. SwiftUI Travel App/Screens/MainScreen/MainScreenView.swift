//
//  ContentView.swift
//  35. SwiftUI Travel App
//
//  Created by Sesili Tsikaridze on 14.12.23.
//

import SwiftUI

struct MainScreenView: View {
    
    @StateObject private var viewModel = MainScreenViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("CHOOSE YOUR DESTINATION")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.textDarkGray)
                
                ScrollView {
                    ForEach(viewModel.destinations, id: \.id) { city in
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: city.image)) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame( height: 150)
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
                            NavigationLink(value: city) {
                                InfoView(city: city)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
                .navigationDestination(for: Destination.self) { city in
                    VStack {
                        DestinationDetailScreenView.init(city: city)
                    }
                }
                
                Button("TRAVEL TIPS") {
                    viewModel.fetchTips()
                    viewModel.showTips()
                }
                .alert(isPresented: $viewModel.showAlert) {
                    let randomTip = viewModel.travelTips.randomElement()
                    return Alert(
                        title: Text(randomTip?.title ?? ""),
                        message: Text(randomTip?.tip ?? ""),
                        dismissButton: .default(Text("OK"))
                    )
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
            .padding(.top, 15)
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}

//MARK: - Separate Views

struct InfoView: View {
    var city: Destination
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundStyle(Color.textDarkGray)
                Text("\(city.name), \(city.country)")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.cyan)
                Spacer()
            }
            HStack {
                ForEach(city.activities, id: \.self) { activity in
                    Text("\(activity),")
                        .font(.system(size: 14, weight: .light))
                        .foregroundStyle(Color.gray)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.top, -20)
    }
}

#Preview {
    MainScreenView()
}
