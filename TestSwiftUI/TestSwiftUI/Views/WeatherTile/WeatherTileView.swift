//
//  WeatherTileView.swift
//  TestSwiftUI
//
//  Created by Vadzim Filipovich on 6/8/21.
//

import SwiftUI

struct WeatherTileView: View {
    @State var textSize: Int
    @State var imageSize: Int
    @State var day: String
    @State var temperature: Int
    
    var body: some View {
        VStack {
            DayTextView(day: day, size: textSize)
            WeatherImageView(size: imageSize)
            TemperatureTextView(temperature: temperature, size: textSize)
        }
    }
}
