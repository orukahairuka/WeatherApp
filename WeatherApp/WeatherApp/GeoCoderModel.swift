//
//  GeoCoderModel.swift
//  WeatherApp
//
//  Created by 櫻井絵理香 on 2024/09/25.
//

import Foundation


// MARK: - Welcome
struct Welcome: Codable {
    let feature: [Feature]

    enum CodingKeys: String, CodingKey {
        case feature = "Feature"
    }
}

// MARK: - Feature
struct Feature: Codable {
    let geometry: Geometry

    enum CodingKeys: String, CodingKey {
        case geometry = "Geometry"
    }
}

// MARK: - Geometry
struct Geometry: Codable {
    let type, coordinates: String

    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case coordinates = "Coordinates"
    }
}
