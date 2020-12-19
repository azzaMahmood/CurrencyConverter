//
//  ConvertCurrenciesViewModel.swift
//  CurrencyConverter
//
//  Created by Azza on 12/16/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation

class ConvertCurrenciesViewModel {
    
    var baseCurrency = ""
    var selectedCurrency = ""
    var currencyRate = 0.0
    
    func convertCurrency(baseCurrency: String) -> String {
        let convertedCurrency = (Double(baseCurrency) ?? 0) * currencyRate
        return String((convertedCurrency*100).rounded()/100)
    }
    
}
