//
//  GenericClientApi.swift
//  CurrencyConverter
//
//  Created by Azza on 12/16/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation
import Alamofire

class GenericClientApi {
    typealias HandleResponse<T: Decodable> = (_ results: T?, _ error: Error?, _ code: Int ) -> Void
    
    @discardableResult
    private static func performRequest<T: Decodable>(route: EndPoints, completion:@escaping (T?, Error?,Int?) -> Void) -> DataRequest {
        return AF.request(route).responseJSON(completionHandler: { (response) in
            switch response.result {
            case .success( _):
                do {
                    let DataResponded = try JSONDecoder().decode(T.self, from: response.data!)
                    completion(DataResponded, nil, response.response?.statusCode)
                } catch {
                    completion(nil, error,response.response?.statusCode)
                }
            case .failure(let error):
                print(error)
                completion(nil, error, response.response?.statusCode)
            }
        })
    }
    static func CallApi<T: Decodable> (endPoint: EndPoints, completion:@escaping (HandleResponse<T>)  ) {
        performRequest(route: endPoint) { (results, error,code) in
            completion(results, error,code ?? 1001 )
        }
    }
}
