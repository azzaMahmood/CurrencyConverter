//
//  CurrenciesConverterTests.swift
//  CurrenciesConverterTests
//
//  Created by Azza on 12/19/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import XCTest
@testable import CurrencyConverter

class ConvertCurrenciesViewModelTests: XCTestCase {
    
    var sut: ConvertCurrenciesViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = ConvertCurrenciesViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        super.tearDown()
    }

    func testConvertCurrency() {
        sut.baseCurrency = "3"
        sut.currencyRate = 2
        XCTAssertEqual(sut.convertCurrency(baseCurrency: sut.baseCurrency), "6.0")
    }

}
