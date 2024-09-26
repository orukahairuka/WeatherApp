//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by 櫻井絵理香 on 2024/09/25.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherManager = WeatherManager()
            let geoCoderManager = GeoCoderManager(weatherManager: weatherManager)
            
            WeatherView(geoCoderManager: geoCoderManager)
        }
    }
}
