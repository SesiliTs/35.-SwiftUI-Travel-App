//
//  DestinationModel.swift
//  35. SwiftUI Travel App
//
//  Created by Sesili Tsikaridze on 14.12.23.
//

import Foundation

import SwiftUI

struct Destination: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let activities: [String]
    let image: String
    let mustSeePlaces: [MustSeePlace]
    let transport: Transport
    let hotels: [Hotel]

    enum CodingKeys: String, CodingKey {
        case id, name, country, description, activities, image, mustSeePlaces, transport, hotels
    }
}

struct MustSeePlace: Decodable, Hashable {
    let name: String
    let description: String
    let image: String
}

struct Transport: Decodable, Hashable {
    let system: String
    let averagePrices: AveragePrices?
}

struct AveragePrices: Decodable, Hashable {
    let metroTicket: Double?
    let busTramTicket: Double?
}

struct Hotel: Decodable, Hashable {
    let name: String
    let priceRange: String
    let link: String
}

struct DestinationsData: Decodable, Hashable {
    let destinations: [Destination]
}
