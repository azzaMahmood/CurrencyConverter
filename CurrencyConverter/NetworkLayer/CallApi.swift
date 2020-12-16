//
//  CallApi.swift
//  CurrencyConverter
//
//  Created by Azza on 12/16/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation
struct LoginResponse: Codable {
    var success: String
}
class CallApi {
    func bookAppointment(parameters: loginParameter, completion: @escaping (_ error: String?, _ subserviceInfoResponse: DefaultResponses<LoginResponse>?) -> Void)  {
        ApiClient.CallApi(endPoint: .login(parameter: parameters)) { (data: DefaultResponses<LoginResponse>?, error: Error?, code) in
            ApiClient.checkErrors(error: error?.localizedDescription, errorSubCategories: error?.localizedDescription, completion: completion)
            completion(nil, data)
        }
    }
}
