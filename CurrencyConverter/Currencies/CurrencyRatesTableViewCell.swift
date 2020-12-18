//
//  CurrencyRatesTableViewCell.swift
//  CurrencyConverter
//
//  Created by Azza on 12/18/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import UIKit

class CurrencyRatesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currencyRateLabel: UILabel!
    
    func configureCellDescription(currencyRate: String) {
        self.currencyRateLabel.text = currencyRate
    }
    
}
