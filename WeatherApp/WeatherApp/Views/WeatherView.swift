//
//  WeatherView.swift
//  WeatherApp
//
//  Created by 櫻井絵理香 on 2024/09/25.
//

import SwiftUI

struct WeatherView: View {
    @State private var inputText = ""
    private var geoCoderManager = GeoCoderManager()
    @StateObject private var weatherManager = WeatherManager()
    var body: some View {
        VStack {
            Text(weatherManager.weather)
                .onChange(of: weatherManager.weather) { newValue in
                        print("天気が更新されました: \(newValue)")
                    }
            TextField("地域を入力して", text: $inputText)
            Button {
                geoCoderManager.fetchCoordinates(query: inputText)
                inputText = ""
            } label: {
                Text("検索")
            }
        }
    }
}

#Preview {
    WeatherView()
}
