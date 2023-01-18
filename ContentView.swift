//
//  ContentView.swift
//  QuickCalc SUI
//
//  Created by Cristian Macovei on 18.01.2023.
//

import SwiftUI


enum MathButtons {
    case notDef
    case add
    case subtract
    case multiply
    case divide
    case modulo
    case decimal
}


struct ContentView: View {
    
    @State var currentValue = ""
    @State var currentMath : MathButtons = .notDef
    @State var lastButtonWasMath = false
    
    let randomRed =     CGFloat.random(in: 0...1)
    let randomGreen =   CGFloat.random(in: 0...1)
    let randomBlue =    CGFloat.random(in: 0...1)
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1))
            VStack(alignment: .trailing) {
                TotalText(value: currentValue)
                HStack {
                    CalcButton(buttonText: "AC", action: didPressAllClear)
                    CalcButton(buttonText: "DEL", action: didPressDel)
                    CalcButton(buttonText: "%", action: didPressMath, mathType: .modulo)
                    CalcButton(buttonText: "/", action: didPressMath, mathType: .divide)
                }
                HStack {
                    CalcButton(buttonText: "7", action: didPressNumber)
                    CalcButton(buttonText: "8", action: didPressNumber)
                    CalcButton(buttonText: "9", action: didPressNumber)
                    CalcButton(buttonText: "*", action: didPressMath, mathType: .multiply)
                }
                HStack {
                    CalcButton(buttonText: "4", action: didPressNumber)
                    CalcButton(buttonText: "5", action: didPressNumber)
                    CalcButton(buttonText: "6", action: didPressNumber)
                    CalcButton(buttonText: "-", action: didPressMath, mathType: .subtract)
                }
                HStack {
                    CalcButton(buttonText: "1", action: didPressNumber)
                    CalcButton(buttonText: "2", action: didPressNumber)
                    CalcButton(buttonText: "3", action: didPressNumber)
                    CalcButton(buttonText: "+", action: didPressMath, mathType: .add)
                }
                HStack() {
                    CalcButton(buttonText: ".", action: didPressNumber, mathType: .decimal)
                    CalcButton(buttonText: "0", action: didPressNumber)
                    CalcButton(buttonText: "=", width: 140, action: didPressEqual)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func addToCurrentValue(value: String) {
        currentValue = currentValue + value
    }
    
    func didPressNumber(button: CalcButton) {
        lastButtonWasMath = false
        addToCurrentValue(value: button.buttonText)
        print(currentValue)
    }
    func didPressMath(button: CalcButton) {
        currentMath = button.mathType
        lastButtonWasMath = true
        addToCurrentValue(value: button.buttonText)
        print(currentValue)
    }
    func didPressEqual(button: CalcButton) {
        if validInput() {
            print("lala")
            let checkForModulo = currentValue.replacingOccurrences(of: "%", with: "*0.01")
            let exp = NSExpression(format: checkForModulo)
            let finalResult = exp.expressionValue(with: nil, context: nil) as! Double
            let resultStr = formatResult(finalResult: finalResult)
                currentValue = resultStr
            print("\(currentValue)")
        }
        lastButtonWasMath = true
    }
    func didPressDel(button: CalcButton) {
        if button.buttonText == "DEL" && !currentValue.isEmpty {
            currentValue.removeLast()
        }
    }
    func didPressAllClear(button: CalcButton) {
        if button.buttonText == "AC" {
            currentValue = ""
        }
    }
    
    func formatResult(finalResult: Double) -> String {
        if (finalResult.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", finalResult)
        } else {
            return String(format: "%.2f", finalResult)
        }
    }
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndex = [Int]()
        for char in currentValue {
            print(char)
            if specialChar(char: char) {
                funcCharIndex.append(count)
            }
            count += 1
        }
        var previousChar = -1
        for index in funcCharIndex {
            if index == 0 || index == currentValue.count - 1 {
                return false
            }
            if previousChar != -1 {
                if index - previousChar == 1 {
                    return false
                }
            }
            previousChar = index
        }
        return true
    }
    
    func specialChar(char: Character) -> Bool {
        if char == "X" || char == "-" || char == "/" || char == "+" {
            return true
        }
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
