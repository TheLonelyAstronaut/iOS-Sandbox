//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Vadzim Filipovich on 6/8/21.
//

import SwiftUI

struct ContentView: View {
    private let mainImageSize: Int = 100
    private let mainTextSize: Int = 20
    
    private let otherImageSize: Int = 50
    private let otherTextSize: Int = 12
    
    @State private var city: String = "Minsk"
    @State private var day: String = "Tuesday"
    @State private var temperature: Int = 23
    
    @State private var isLoading: Bool = true
    @State private var showingSheet = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                if !isLoading {
                    Group {
                        CityNameView(city: $city)
                        WeatherTileView(textSize: mainTextSize,
                                        imageSize: mainImageSize,
                                        day: day,
                                        temperature: temperature)
                            .padding(25)
                        HStack {
                            WeatherTileView(textSize: otherTextSize,
                                            imageSize: otherImageSize,
                                            day: day,
                                            temperature: temperature)
                            WeatherTileView(textSize: otherTextSize,
                                            imageSize: otherImageSize,
                                            day: day,
                                            temperature: temperature)
                            WeatherTileView(textSize: otherTextSize,
                                            imageSize: otherImageSize,
                                            day: day,
                                            temperature: temperature)
                            WeatherTileView(textSize: otherTextSize,
                                            imageSize: otherImageSize,
                                            day: day,
                                            temperature: temperature)
                        }
                        AppButtonView(text: "Choose city") {
                                    showingSheet = true
                                }
                                .sheet(isPresented: $showingSheet) {
                                    ChooseCityView(searchCallback: self.search)
                                }
                        
                    }
                } else {
                    Group {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    }
                }
            }
        }.onAppear { self.bindListeners() }
    }
    
    func bindListeners() {
        isLoading = false
    }
    
    func search(city: String) {
        print(city)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 12")
        }
    }
}
