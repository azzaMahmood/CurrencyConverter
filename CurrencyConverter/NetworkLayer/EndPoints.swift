//
//  EndPoints.swift
//  CurrencyConverter
//
//  Created by Azza on 12/16/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation
import Alamofire
enum EndPoints: APIConfigurations {
    
    case symbols
    case latest(parameter: [String:  Any])
    
    var method: HTTPMethod {
        return .get
    }
    
    internal var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var path: String {
        switch self {
        case .symbols:
            return "symbols"
        case .latest:
            return "latest"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = ConstantsAPI.baseUrl + path + ConstantsAPI.accessKey
        let finalURl = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        var urlRequest = URLRequest(url: URL(string: finalURl)!)
        urlRequest.httpMethod = method.rawValue
        return  urlRequest
    }
    
}
