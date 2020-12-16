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
    
    case bookingList(parameters:[String:  Any])
    case login(parameter: loginParameter)
  
    var method: HTTPMethod {
        switch self {
        case .bookingList, .login:
            return .post
        }
    }

    internal var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        case .post:
          return  JSONEncoding.default
        default:
           return JSONEncoding.default
    }
    }

    var path: String {
        switch self {
        case .bookingList:
            return "booking/list"
        case .login:
            return "test"
        }
    }

    var parameters: Parameters? {
        switch self {
        case .bookingList(let parameters):
            return parameters
        case .login(let parameters):
            return parameters.dictionary
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = ConstantsAPI.ProductionServer.baseUrl + path
        let finalURl = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!

        var urlRequest = URLRequest(url: URL(string: finalURl)!)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        print(url)
        // Common Headers
//        if path == "RedeemList" {
//            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
//        }
//        if UserDefaults.standard.value(forKey: "userData") != nil {
//            let data  = UserDefaults.standard.value(forKey: "userData") as! [String: String]
//            let header = "Bearer " + data["token"]!
//        let authHeader = "Bearer " + Defaults.token
//        let lang = LanguageManger.shared.currentLanguage.rawValue
//
//        urlRequest.setValue(authHeader, forHTTPHeaderField: "Authorization")
//        urlRequest.setValue(lang, forHTTPHeaderField: "lang")
        
//        }
//        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        if let parameters = parameters {
            do {
                print("PARMAETERS \(parameters)")
                urlRequest = try encoding.encode(urlRequest, with: parameters)
                let body = try JSONSerialization.data(withJSONObject: parameters)
                urlRequest.httpBody = body
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }

        // Parameters
        return  urlRequest

    }

}
