//
//  ColorSliderView.swift
//  SwiftUIColorized
//
//  Created by Sergei Bakhmatov on 12.06.2023.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var value: Double
    let tintColor: Color
    
    var body: some View {
        
        Slider(value: $value, in: 0...255, step: 1).tint(tintColor)
            
    }
}
