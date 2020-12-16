//
//  ConstantsAPI.swift
//  CurrencyConverter
//
//  Created by Azza on 12/16/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation
import Alamofire
struct ConstantsAPI {
    struct ProductionServer {
        static let baseUrl = "http://lighthouse-eg.net/edal/public/api/provider/"
    }
    struct APIParameterKey {
        static let apiKey = ""
    }
    static let lang = String(Locale.preferredLanguages[0].prefix(2))
}
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case contentType = "application/json"

}

//
//struct Languages {
//    static func getLanguagesId () -> String {
//        if String(Locale.preferredLanguages[0].prefix(2)) == "en" {
//            return "280ede65-e3ca-4449-9502-77df344351ca"
//        }else if String(Locale.preferredLanguages[0].prefix(2)) == "ar" {
//            return "4be57d56-8ba3-4462-83ab-47a370308280"
//        }else {
//            return ""
//        }
//    }
//}
