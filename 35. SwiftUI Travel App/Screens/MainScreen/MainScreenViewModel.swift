//
//  MainScreenViewModel.swift
//  35. SwiftUI Travel App
//
//  Created by Sesili Tsikaridze on 14.12.23.
//

import Foundation
import NetworkManager

final class MainScreenViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published var destinations = [Destination]()
    @Published var travelTips = [TravelTip]()
    @Published var showAlert = false

    private let url = "https://mocki.io/v1/d22e4580-60da-46ab-a738-b075c0936947"
    private let tipsURL = "https://mocki.io/v1/15d6c865-c548-4c37-bb36-60af0cb3a100"
    
    //MARK: - Functions
    
    func showTips() {
        showAlert = true
    }
    
    //MARK: - Fetch Data from API
    
    func fetchData() {
        NetworkService.shared.getData(urlString: url) { [weak self] (result: Result<DestinationsData, Error>) in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                self.destinations = data.destinations
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchTips() {
        NetworkService.shared.getData(urlString: tipsURL) { [weak self] (result: Result<TravelTipsData, Error>) in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                self.travelTips = data.travelTips
            case .failure(let error):
                print(error)
            }
        }
    }
}
