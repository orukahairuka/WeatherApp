//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by 櫻井絵理香 on 2024/09/25.
//

import Foundation
import Alamofire
import Combine

class WeatherManager: ObservableObject {
    @Published var weather: String = "不明"
    func fetchWether(coordinate: String) {
        let url = "https://map.yahooapis.jp/weather/V1/place"
        let coordinate = coordinate
        
        let parameters:[String: String] = [
            "appid":"dj00aiZpPVo5RTFsZ1pXUWNvNCZzPWNvbnN1bWVyc2VjcmV0Jng9MjE-",
            "coordinates": coordinate,
            "output": "json"
        ]
        
        AF.request(url, parameters: parameters).responseDecodable(of: WeatherData.self) { response in
            switch response.result {
            case .success(let data):
                if let firstWeather = data.feature.first?.property.weatherList.weather.first {
                    print("Weather:\(firstWeather.rainfall)")
                     self.judgeWeather(rainfall: firstWeather.rainfall)
                } else {
                    print("天気取得できず")
                }
            case .failure(let error):
                print("api取得失敗")
            }
        }
    }

    func judgeWeather(rainfall: Double) {
            if 0.0 <= rainfall && rainfall < 0.5 {
                print("晴れ")
                self.weather = "晴れ"
            } else if 0.5 <= rainfall && rainfall < 1.0 {
                print("小雨")
                self.weather = "小雨"
            } else if 1.0 <= rainfall && rainfall < 10.0 {
                print("雨")
                self.weather = "雨"
            } else if 10.0 <= rainfall {
                print("強い雨")
                self.weather = "強い雨"
            }
    }
}
