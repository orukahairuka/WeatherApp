//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by 櫻井絵理香 on 2024/09/25.
//

import Foundation

// MARK: - WeatherData (全体)
struct WeatherData: Codable {
    let resultInfo: ResultInfo
    let feature: [Feature]

    enum CodingKeys: String, CodingKey {
        case resultInfo = "ResultInfo"
        case feature = "Feature"
    }
}

// MARK: - ResultInfo (メタ情報)
struct ResultInfo: Codable {
    let count, total, start, status: Int
    let latency: Double
    let description: String

    enum CodingKeys: String, CodingKey {
        case count = "Count"
        case total = "Total"
        case start = "Start"
        case status = "Status"
        case latency = "Latency"
        case description = "Description"
    }
}

// MARK: - Feature (各地点の天気情報)
struct Feature: Codable {
    let id, name: String
    let property: Property

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case property = "Property"
    }
}

// MARK: - Property (天気の詳細)
struct Property: Codable {
    let weatherAreaCode: Int
    let weatherList: WeatherList

    enum CodingKeys: String, CodingKey {
        case weatherAreaCode = "WeatherAreaCode"
        case weatherList = "WeatherList"
    }
}

// MARK: - WeatherList (天気リスト)
struct WeatherList: Codable {
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case weather = "Weather"
    }
}

// MARK: - Weather (各時間の天気情報)
struct Weather: Codable {
    let type, date: String
    let rainfall: Double

    enum CodingKeys: String, CodingKey {
        case type = "Type"
        case date = "Date"
        case rainfall = "Rainfall"
    }
}
