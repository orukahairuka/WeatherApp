//
//  GeoCoderManager.swift
//  WeatherApp
//
//  Created by 櫻井絵理香 on 2024/09/25.
//

import Foundation
import Alamofire

func fetchCoordinates(query:String) {
    let url = "https://map.yahooapis.jp/geocode/cont/V1/contentsGeoCoder"

    //エンコードの処理
    guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
        print("エンコードに失敗しました")
        return
    }
    
    let parameters:[String: String] = [
        "appid":"dj00aiZpPVo5RTFsZ1pXUWNvNCZzPWNvbnN1bWVyc2VjcmV0Jng9MjE-",
        "query": encodedQuery,
        "category": "address",
        "output": "json"
    ]
    
    AF.request(url, parameters: parameters).responseDecodable(of: GeoWelcome.self) { response in
        switch response.result {
        case .success(let data):
            if let coordinates = data.feature.first?.geometry.coordinates {
                print("Coordinates:\(coordinates)")
                fetchWether(coordinate: coordinates)
            } else {
                print("座標取得できず")
            }
        case .failure(let error):
            print("api取得失敗")
        }
    }
    
}

