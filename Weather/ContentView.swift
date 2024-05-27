//
//  ContentView.swift
//  Weather
//
//  Created by Uzair Ahmed on 2024-05-20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    
    var body: some View {
        ZStack {
            ScreenMode(isNight: $isNight)
            VStack {
                CityTextView(CityName: "Oakville, ON")
                VStack (spacing: 6) {
                    MainWeatherView(picture: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: 76)
                }
                .padding(.bottom, 40)
                
                
                HStack (spacing: 30){
                    WeatherdayView(dayOfTheWeek: "TUE", picture: "sun.rain.fill", temp: 60)
                    WeatherdayView(dayOfTheWeek: "WED",
                        picture: "cloud.fill", temp: 30)
                    WeatherdayView(dayOfTheWeek: "THU",
                        picture: "cloud.snow.fill", temp: 48)
                    WeatherdayView(dayOfTheWeek: "FRI",
                        picture: "cloud.bolt.rain.fill", temp: 38)
                    WeatherdayView(dayOfTheWeek: "SAT",
                        picture: "sun.rain.fill", temp: 90)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    Weatherbutton(title: "Change Day Time", fontcolor: .black)
                }
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherdayView: View {
    
    var dayOfTheWeek: String
    var picture: String
    var temp: Int
    
    var body: some View {
        
        VStack{
            Text(dayOfTheWeek)
                .font(.system(size: 18))
                .foregroundColor(.white)
            Image(systemName: picture)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 28))
                .foregroundColor(.white)
        }
    }
}

struct ScreenMode: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .lightBlue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var CityName: String
    var body: some View {
        Text(CityName)
            .font(.system(size: 32))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherView: View {
    var picture: String
    var temp: Int
    
    var body: some View {
        Image(systemName: picture)
            .symbolRenderingMode(.multicolor)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
        Text("\(temp)°")
            .font(.system(size: 70))
            .foregroundColor(.white)

    }
}
//2:03:00
