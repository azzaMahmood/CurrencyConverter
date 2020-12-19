//
//  CurrenciesViewController.swift
//  CurrencyConverter
//
//  Created by Azza on 12/16/20.
//  Copyright © 2020 Azza. All rights reserved.
//
import UIKit
import DropDown

 
class CurrenciesViewController: UIViewController {
    
    @IBOutlet weak var selectBaseCurrencyButton: UIButton!
    @IBOutlet weak var currencyRatesTableView: UITableView!
    
    let viewModel = CurrenciesViewModel(clientAPI: ClientAPI())
    let getCurrencies = DropDown()
    var baseCurrency = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Currencies"
        currencyRatesTableView.delegate = self
        currencyRatesTableView.dataSource = self
    }
    
    func setupGetCurrencies() {
        getCurrencies.width = 200
        getCurrencies.direction = .top
        getCurrencies.topOffset = CGPoint(x: 100, y: 0)
        getCurrencies.dataSource = viewModel.getFlags()
        getCurrencies.selectionAction = { [weak self] (index, item) in
            self?.selectBaseCurrencyButton.setTitle("Base currency is: \(item)" , for: .normal)
            self?.baseCurrency = item
            let baseCurrency = String(item.dropFirst(2))
            self?.viewModel.clientAPI.getCurrencyRates(base: baseCurrency, completion: { [weak self] (responseData) in
                let rates = Array(responseData.rates.values)
                self?.viewModel.currencyRates = rates.map { String($0) }
                self?.currencyRatesTableView.isHidden = false
                self?.currencyRatesTableView.animate()
            })
        }
    }
    
    @IBAction func selectBaseCurrencyClicked(_ sender: UIButton) {
        setupGetCurrencies()
        getCurrencies.show()
    }    
}

extension CurrenciesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getFlags().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyRatesTableViewCell", for: indexPath) as! CurrencyRatesTableViewCell
        // Double(round(1000*x)/1000)

        let currency = viewModel.getFlags()[indexPath.row] + ": [" + viewModel.currencyRates[indexPath.row] + "]"
        cell.configureCellDescription(currencyRate: currency)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let convertViewController = storyboard?.instantiateViewController(withIdentifier: "ConvertCurrenciesViewController") as! ConvertCurrenciesViewController
        convertViewController.viewModel.baseCurrency = baseCurrency
        convertViewController.viewModel.selectedCurrency = viewModel.getFlags()[indexPath.item]
        convertViewController.viewModel.currencyRate = Double(viewModel.currencyRates[indexPath.item]) ?? 0.0
        navigationController?.pushViewController(convertViewController, animated: true)
    }
}
