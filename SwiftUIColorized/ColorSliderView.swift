//
//  ColorSliderView.swift
//  SwiftUIColorized
//
//  Created by Sergei Bakhmatov on 12.06.2023.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var value: Double
    @Binding var tintColor: Color
    
    var body: some View {
        
        Slider(value: $value, in: 0...255, step: 1)
            .tint(tintColor)
            
    }
}

//struct ColorSliderView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ColorSliderView()
//    }
//}
