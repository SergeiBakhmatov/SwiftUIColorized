//
//  ContentView.swift
//  SwiftUIColorized
//
//  Created by Sergei Bakhmatov on 12.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue = Double.random(in: 1...255)
    @State private var tintColorRed: Color = .red
    
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            HStack {
                ValueTextView(value: sliderValue)
                SliderView(value: $sliderValue, tintColor: $tintColorRed)
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
