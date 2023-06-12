//
//  ContentView.swift
//  SwiftUIColorized
//
//  Created by Sergei Bakhmatov on 12.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 1...255)
    @State private var greenValue = Double.random(in: 1...255)
    @State private var blueValue = Double.random(in: 1...255)
    
    private let colorRed: Color = .red
    private let colorGreen: Color = .green
    private let colorBlue: Color = .blue
    
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            
            VStack {
                
                ColorView(
                    colorRedValue: redValue,
                    colorGreenValue: greenValue,
                    colorBlueValue: blueValue
                )
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                
                ColorPickerView(value: $redValue, color: colorRed)
                ColorPickerView(value: $greenValue, color: colorGreen)
                ColorPickerView(value: $blueValue, color: colorBlue)
                
                Spacer()
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorPickerView: View {
    
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            ValueTextView(value: value)
            SliderView(value: $value, tintColor: color)
        }
    }
}

struct ColorView: View {
    
    let colorRedValue: Double
    let colorGreenValue: Double
    let colorBlueValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(width: 350, height: 150)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 4))
            .foregroundColor(
                Color(
                    red: colorRedValue/255,
                    green: colorGreenValue/255,
                    blue: colorBlueValue/255
                )
            )
    }
}
