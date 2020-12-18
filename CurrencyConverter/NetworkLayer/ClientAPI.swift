//
//  ClientAPI.swift
//  CurrencyConverter
//
//  Created by Azza on 12/16/20.
//  Copyright © 2020 Azza. All rights reserved.
//


import Foundation

protocol ClientAPIType {
    func getCurrencySymbols(completion: @escaping (_ list: CurrencySymbols) -> Void)
    func getCurrencyRates(base: String, completion: @escaping (_ list: CurrencyRates) -> Void)
}

class ClientAPI: ClientAPIType {
    func getCurrencySymbols(completion: @escaping (_ list: CurrencySymbols) -> Void) {
        let endPoint = EndPoints.symbols
        GenericClientApi.CallApi(endPoint: endPoint) { (result: CurrencySymbols?, error: Error?, code) in
            guard let resultResponse = result else { return }
            completion(resultResponse)
        }
    }
    
    func getCurrencyRates(base: String, completion: @escaping (CurrencyRates) -> Void) {
        let endPoint = EndPoints.latest(parameter: [base:base])
        GenericClientApi.CallApi(endPoint: endPoint) { (result: CurrencyRates?, error: Error?, code) in
            guard let resultResponse = result else { return }
            completion(resultResponse)
        }
    }

}
