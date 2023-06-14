//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Perttu Valtonen on 14.6.2023.
//

import XCTest
@testable import Calculator

final class CalculatorTests: XCTestCase {
    
    func testCalculateSum() {
        let controller = CalculatorController()
        controller.firstValue = "2"
        controller.secondValue = "3"
        controller.calculateSum()
        XCTAssertEqual(controller.result, 5)
    }
    
    func testShowAlert() {
        let controller = CalculatorController()
        controller.result = 5
        
        // Create a mock UIWindow to present the alert
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController()
        window.makeKeyAndVisible()
        
        //Call showAlert() and make sure the alert is presented
        controller.showAlert()
        //XCTAssertTrue(window.rootViewController?.presentedViewController is UIAlertController)
        
        // Dismiss the alert
        window.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    func testWebLinkAsync() async throws {
        // Create a URL for a webpage to download
        let url = URL(string: "https://bstackdemo.com")!
        
        // Use an asynchronous function to download the webpage
        let dataAndResponse: (data: Data, response: URLResponse) = try await URLSession.shared.data(from: url, delegate: nil)
        
        // Assert that the actual response matches the expected response
        let httpResponse = try XCTUnwrap(dataAndResponse.response as? HTTPURLResponse, "Expected an HTTPURLResponse.")
        XCTAssertEqual(httpResponse.statusCode, 200, "Expected a 200 OK response.")
    }
    
    func testCalculateSumAsync() {
        let controller = CalculatorController()
        controller.firstValue = "2"
        controller.secondValue = "3"
        
        let expectation = XCTestExpectation(description: "calculateSum() completes")
        
        DispatchQueue.main.async {
            controller.calculateSum()
            XCTAssertEqual(controller.result, 5)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    class MockCalculatorController: CalculatorController {
        var calculateSumCalled = false
        
        override func calculateSum() {
            calculateSumCalled = true
            result = 5
        }
    }
    
    func testCalculateSumWithMock() {
        let controller = MockCalculatorController()
        controller.firstValue = "2"
        controller.secondValue = "3"
        
        controller.calculateSum()
        
        XCTAssertTrue(controller.calculateSumCalled)
        XCTAssertEqual(controller.result, 5)
    }
}
