//
//  WeatherView.swift
//  WeatherApp
//
//  Created by 櫻井絵理香 on 2024/09/25.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var inputText = ""
    @State private var geoCoderManager: GeoCoderManager
    @StateObject private var weatherManager = WeatherManager()
    // カスタムイニシャライザを追加
    init(geoCoderManager: GeoCoderManager) {
        _geoCoderManager = State(initialValue: geoCoderManager)
    }
    
    var body: some View {
        VStack {
            Text(weatherManager.weather)
            
            TextField("地域を入力して", text: $inputText)
            Button {
                geoCoderManager.fetchCoordinates(query: inputText)
                inputText = ""
            } label: {
                Text("検索")
            }
        }
        .onAppear {
            // @StateObjectのweatherManagerが初期化された後で、geoCoderManagerを初期化
            geoCoderManager = GeoCoderManager(weatherManager: weatherManager)
        }
    }
}

