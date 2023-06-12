//
//  ValueTextView.swift
//  SwiftUIColorized
//
//  Created by Sergei Bakhmatov on 12.06.2023.
//

import SwiftUI

struct ValueTextView: View {
    
    let value: Double
    
    var body: some View {
        
        Text("\(lround(value))").foregroundColor(.white)
            .frame(width: 40)
        
    }
}

struct ValueTextView_Previews: PreviewProvider {
    static var previews: some View {
        ValueTextView(value: 44)
    }
}
