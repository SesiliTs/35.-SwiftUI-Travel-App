//
//  TravelTipsModel.swift
//  35. SwiftUI Travel App
//
//  Created by Sesili Tsikaridze on 14.12.23.
//

import Foundation

struct TravelTip: Identifiable, Decodable {
    let id: Int
    let title: String
    let tip: String
}

struct TravelTipsData: Decodable {
    let travelTips: [TravelTip]
}
