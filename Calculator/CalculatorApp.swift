//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Perttu Valtonen on 14.6.2023.
//

import SwiftUI
import UIKit

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(controller: CalculatorController())
        }
    }
}

class CalculatorController: ObservableObject {
    @Published var firstValue: String = ""
    @Published var secondValue: String = ""
    @Published var result: Int = 0
    
    func calculateSum() {
        if let first = Int(firstValue), let second = Int(secondValue) {
            result = first + second
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Result", message: "The sum is \(result)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first {
            window.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}
