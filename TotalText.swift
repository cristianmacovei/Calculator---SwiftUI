//
//  TotalText.swift
//  QuickCalc SUI
//
//  Created by Cristian Macovei on 18.01.2023.
//

import SwiftUI

struct TotalText: View {
    
    var value : String = "0"
    var body: some View {
        Text(value)
            .font(.custom("copperplate", size: 60))
            .fontWeight(.light)
            .padding()
            .foregroundColor(.black)
            .lineLimit(1)
    }
}

struct TotalText_Previews: PreviewProvider {
    static var previews: some View {
        TotalText()
        
    }
}
