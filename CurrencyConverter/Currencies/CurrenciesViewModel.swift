//
//  CurrenciesViewModel.swift
//  CurrencyConverter
//
//  Created by Azza on 12/16/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation

class CurrenciesViewModel {
    
    let clientAPI: ClientAPIType
    var currencySymbols: [String] = []
    var currencyRates: [String] = []
    var baseCurrency: String = ""
    
    init(clientAPI: ClientAPIType) {
        self.clientAPI = clientAPI
        clientAPI.getCurrencySymbols { [weak self] (responseData) in
            self?.currencySymbols = Array(responseData.symbols.keys)
        }
    }
    
    func getFlags() -> [String]{
        return currencySymbols.map { "\(flag(country: String($0.dropLast()))) \($0)"}
    }
    
    private func flag(country:String) -> String {
        let base = 127397
        var flag = String.UnicodeScalarView()
        for i in country.utf16 {
            flag.append(UnicodeScalar(base + Int(i))!)
        }
        return String(flag)
    }    
    
}
