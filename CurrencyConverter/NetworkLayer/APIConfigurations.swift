//
//  APIConfigurations.swift
//  CurrencyConverter
//
//  Created by Azza on 12/16/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import Alamofire
protocol APIConfigurations: URLRequestConvertible {
    var method: HTTPMethod {get}
    var path: String {get}
    var parameters: Parameters? {get}
}
