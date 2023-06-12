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
    
    @State private var valueRedTF = 0.0
    @State private var valueGreenTF = 0.0
    @State private var valueBlueTF = 0.0
    
    @State private var colorRed: Color = .red
    @State private var colorGreen: Color = .green
    @State private var colorBlue: Color = .blue
    
    @FocusState private var redIsFocused: Bool
    @FocusState private var greenIsFocused: Bool
    @FocusState private var blueIsFocused: Bool
    
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
                
                HStack {
                    ColorPickerView(value: $redValue, color: $colorRed)
                    TextField("0",
                              value: redIsFocused ? $valueRedTF : $redValue,
                              format: .number.rounded(
                                rule: .toNearestOrAwayFromZero,
                                increment: 1.0)
                    )
                    .frame(width: 50, height: 30)
                    .background()
                    .multilineTextAlignment(.trailing)
                    .cornerRadius(3)
                    .foregroundColor(.black)
                    .keyboardType(.numberPad)
                    .focused($redIsFocused)
                }
                HStack {
                    ColorPickerView(value: $greenValue, color: $colorGreen)
                    TextField("0",
                              value: greenIsFocused ? $valueGreenTF : $greenValue,
                              format: .number.rounded(
                                rule: .toNearestOrAwayFromZero,
                                increment: 1.0)
                    )
                    .frame(width: 50, height: 30)
                    .background()
                    .multilineTextAlignment(.trailing)
                    .cornerRadius(3)
                    .foregroundColor(.black)
                    .keyboardType(.numberPad)
                    .focused($greenIsFocused)
                }
                HStack {
                    ColorPickerView(value: $blueValue, color: $colorBlue)
                    TextField("0",
                              value: blueIsFocused ? $valueBlueTF : $blueValue,
                              format: .number.rounded(
                                rule: .toNearestOrAwayFromZero,
                                increment: 1.0)
                    )
                    .frame(width: 50, height: 30)
                    .background()
                    .multilineTextAlignment(.trailing)
                    .cornerRadius(3)
                    .foregroundColor(.black)
                    .keyboardType(.numberPad)
                    .focused($blueIsFocused)
                }
                
                Spacer()
                
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Button("Done", action: action)
                        .padding(EdgeInsets(top: 0, leading: 300, bottom: 0, trailing: 0))
                }
            }
            .padding()
        }
        .onTapGesture {
            redIsFocused = false
            greenIsFocused = false
            blueIsFocused = false
        }
        
    }
    private func action() {
        if redIsFocused {
            redValue = valueRedTF
            redIsFocused.toggle()
        }
        if greenIsFocused {
            greenValue = valueGreenTF
            greenIsFocused.toggle()
        }
        if blueIsFocused {
            blueValue = valueBlueTF
            blueIsFocused.toggle()
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

