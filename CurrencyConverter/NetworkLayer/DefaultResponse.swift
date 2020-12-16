//
//  DefaultResponses.swift
//  CurrencyConverter
//
//  Created by Azza on 12/16/20.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation

struct DefaultResponses <T: Decodable>: Decodable {
    // TODO
    var lang: String
    var status: String
    var errorMsg: String
    var errors: [String: String]?
    var response: T?
    
    enum CodingKeys: String, CodingKey {
        case lang, status
        case errorMsg = "error_msg"
        case errors
        case response = "default_response"
    }
    
}

struct Metaa: Codable {
    var pagination: Paginationn?
}

// MARK: - Pagination
struct Paginationn: Codable {
    var total, count, perPage, currentPage: Int?
    var totalPages: Int?
    var links: Errors?

    enum CodingKeys: String, CodingKey {
        case total, count
        case perPage = "per_page"
        case currentPage = "current_page"
        case totalPages = "total_pages"
        case links
    }
}
struct Errors: Codable {
}

