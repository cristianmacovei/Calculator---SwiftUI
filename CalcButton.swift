//
//  CalcButton.swift
//  QuickCalc SUI
//
//  Created by Cristian Macovei on 18.01.2023.
//

import SwiftUI

struct CalcButton: View {
    
    var buttonText: String = "1"
    var width: CGFloat = 70
    ///We define an action with Button as a parameter - a reference to the Button that was pressed, no return type (VOID) and defined initially as an empty closure
    var action: (CalcButton) -> Void = {_ in }
    var mathType : MathButtons = MathButtons.notDef
    var body: some View {
        
        Button {
            action(self)
        } label: {
            Text(buttonText)
                .font(.custom("copperplate", size: 35))
                .frame(width: width, height: 70, alignment: .center)
                .foregroundColor(.black)
                .padding(5)
        }
    }
}

struct CalcButton_Previews: PreviewProvider {
    static var previews: some View {
        CalcButton()
    }
}
