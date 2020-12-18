//
//  CurrencySymbols.swift
//  CurrencyConverter
//
//  Created by Azza on 12/18/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation

struct CurrencySymbols: Codable {
    let success: Bool
    let symbols: [String: String]
}
