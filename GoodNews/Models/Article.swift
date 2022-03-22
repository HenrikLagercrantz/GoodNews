//
//  Article.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2022-03-16.
//  Copyright © 2022 Zelo. All rights reserved.
//

import Foundation
import UIKit

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
    let urlToImage: String?
    
    let author: String?
    let url: String?
    let publishedAt: String?
    let content: String?
    
    let source: Source
    

    
    
}

struct Source: Decodable {
    let id: String?
    let name: String?
    
}

