//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by 櫻井絵理香 on 2024/09/25.
//

import Foundation
import Alamofire

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
                print("Weather:\(firstWeather)")
            } else {
                print("天気取得できず")
            }
        case .failure(let error):
            print("api取得失敗")
        }
    }
}
