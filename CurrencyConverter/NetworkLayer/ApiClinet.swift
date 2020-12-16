//
//  ApiClient.swift
//  CurrencyConverter
//
//  Created by Azza on 12/16/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient {
    typealias HandleResponse<T: Decodable> = (_ results: DefaultResponses<T>?, _ error: Error?, _ code: Int ) -> Void

    @discardableResult
    private static func performRequest<T: Decodable>(route: EndPoints, completion:@escaping (DefaultResponses<T>?, Error?,Int?) -> Void) -> DataRequest {
        
        return AF.request(route).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success(let value):
                    print(value)
                do {
                    let DataResponsed = try JSONDecoder().decode(DefaultResponses<T>.self, from: response.data!)
                    completion(DataResponsed, nil, response.response?.statusCode)
                } catch {
                    print(error)
                    completion(nil, error,response.response?.statusCode)
                }
            case .failure(let error):
                print(error)
                completion(nil, error, response.response?.statusCode)
            }
        }
        ) }
    // func Generic post // get
    static func CallApi<T: Decodable> (endPoint: EndPoints, completion:@escaping (HandleResponse<T>)  ) {
        performRequest(route: endPoint) { (results, error,code) in
            completion(results, error,code ?? 1001 )
        }
    }
    
    static func checkErrors <T: Decodable>(error: String?, errorSubCategories: String?, completion: @escaping ( _ error: String?,  _ subserviceInfoResponse: T?) -> Void) {
        guard error == nil else {
            completion(error,nil)
            return
        }
        guard errorSubCategories == nil else {
            completion(errorSubCategories,nil)
            return
        }
    }
    
}
