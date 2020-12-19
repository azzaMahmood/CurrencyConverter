//
//  CurrenciesViewModelTests.swift
//  CurrenciesConverterTests
//
//  Created by Azza on 12/19/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import XCTest
@testable import CurrencyConverter


class CurrenciesViewModelTests: XCTestCase {
    
    var sut: CurrenciesViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = CurrenciesViewModel(clientAPI: ClientAPI())
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }
    
    func testConvertCurrency() {
        sut.currencySymbols = ["USD","KMF", "JMD", "LSL", "BYN"]
        XCTAssertEqual(sut.getFlags()[0], "🇺🇸 USD")
    }
    
}
