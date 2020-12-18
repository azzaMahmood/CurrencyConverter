//
//  CurrencyRates.swift
//  CurrencyConverter
//
//  Created by Azza on 12/18/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation

struct CurrencyRates: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: [String: Double]
}
