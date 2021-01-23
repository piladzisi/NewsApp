//
//  Article.swift
//  News App
//
//  Created by Anna Sibirtseva on 22/01/2021.
//

import Foundation

struct Article: Decodable {
    let headline: String
    let urlToImage: String?
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case headline = "title"
        case urlToImage
        case url
    }
}
