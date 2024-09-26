//
//  WeatherView.swift
//  WeatherApp
//
//  Created by 櫻井絵理香 on 2024/09/25.
//

import SwiftUI

struct WeatherView: View {
    @State private var inputText = ""
    var body: some View {
        TextField("地域を入力して", text: $inputText)
        Button {
            fetchCoordinates(query: inputText)
            inputText = ""
        } label: {
            Text("検索")
        }
    }
}

#Preview {
    WeatherView()
}
