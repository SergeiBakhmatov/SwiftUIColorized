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
    
    @State private var colorRed: Color = .red
    @State private var colorGreen: Color = .green
    @State private var colorBlue: Color = .blue
    
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            VStack {
                ColorPicker(value: $redValue, color: $colorRed)
                ColorPicker(value: $greenValue, color: $colorGreen)
                ColorPicker(value: $blueValue, color: $colorBlue)
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

struct ColorPicker: View {
    
    @Binding var value: Double
    @Binding var color: Color
    
    var body: some View {
        HStack {
            ValueTextView(value: value)
            SliderView(value: $value, tintColor: $color)
        }
    }
}
