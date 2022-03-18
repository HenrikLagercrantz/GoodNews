//
//  GoodNewsViewModel.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2022-03-16.
//  Copyright © 2022 Zelo. All rights reserved.
//

import Foundation
import UIKit

struct ArticleViewModel {
    
    private let article: Article
    

    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
    
    var newsImage: UIImage {
        if let url = self.article.urlToImage {
           return WebService().fetchImageWith(url) 

           }
        return UIImage(imageLiteralResourceName: "newsImage")
    }

    
   
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}
