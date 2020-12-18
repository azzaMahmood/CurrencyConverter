//
//  ConvertCurrenciesViewController.swift
//  CurrencyConverter
//
//  Created by Azza on 12/16/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import UIKit

class ConvertCurrenciesViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var baseCurrencyLabel: UILabel!
    @IBOutlet weak var baseAmountTextField: UITextField!
    @IBOutlet weak var selectedCurrencyLabel: UILabel!
    @IBOutlet weak var selectedCurrencyAmountLabel: UILabel!
    
    let viewModel = ConvertCurrenciesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseAmountTextField.delegate = self
        updateUI()
    }
    
    func updateUI() {
        self.title = "Convert Currencies"
        baseCurrencyLabel.text = viewModel.baseCurrency
        selectedCurrencyLabel.text = viewModel.selectedCurrency
        baseAmountTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {        
        let allowedCharacters = "1234567890"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func textDidChange(textField: UITextField) {
        selectedCurrencyAmountLabel.text = viewModel.convertCurrency(baseCurrency: baseAmountTextField.text ?? "0.00")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
