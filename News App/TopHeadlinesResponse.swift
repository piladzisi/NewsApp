//
//  TopHeadlinesResponse.swift
//  News App
//
//  Created by Anna Sibirtseva on 23/01/2021.
//

import Foundation

struct TopHeadlinesResponse: Decodable {
    let articles: [Article]
}
