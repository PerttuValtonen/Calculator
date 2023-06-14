//
//  ContentView.swift
//  Calculator
//
//  Created by Perttu Valtonen on 14.6.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var controller: CalculatorController

    var body: some View {
        VStack {
            Text("Calculator")
                .font(.title)
                .padding()
            HStack {
                TextField("Enter first value", text: $controller.firstValue)
                    .padding()
                    .keyboardType(.numberPad)
                TextField("Enter second value", text: $controller.secondValue)
                    .padding()
                    .keyboardType(.numberPad)
            }
            
            Button("Calculate") {
                controller.calculateSum()
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(controller: CalculatorController())
    }
}
