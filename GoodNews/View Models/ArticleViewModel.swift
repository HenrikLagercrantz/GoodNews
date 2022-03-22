//
//  GoodNewsViewModel.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2022-03-16.
//  Copyright © 2022 Zelo. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct ArticleViewModel {
    
    private let article: Article
 
 
    
    var title: String {
        return self.article.title ?? ""
    }
    
    var description: String {
        return self.article.description ?? ""
    }
    
    
    var author: String {
        return self.article.author ?? ""
    }
    
    var url: String {
        return self.article.url ?? ""
    }
    
    var publishedAt: String {
        return self.article.publishedAt ?? ""
    }

    var content: String {
        return self.article.content ?? ""
    }
    
    var id: String {
        return self.article.source.id ?? ""
    }

    var name: String {
        return self.article.source.name ?? ""
    }
    
    var newsImage: UIImage? {
        return UrlImageModel(urlString: self.article.urlToImage).image
    }
    
    var newsImageView: some View {
        return UrlImageView(urlString: self.article.urlToImage)
    }
    
    
  //  var image: UIImage?
    
    
//    mutating func fetchNewsImage(){
//               if let image = WebService().fetchImageWith(url) {
//                   self.image = image
//           } else {
//               self.image = nil
//           }
//   }
    

 
//    @ViewBuilder
//    func fetchNewsImageView(image: UIImage?) -> some View {
//
//        guard image != nil else {
//         Image(uiImage: image!)
//                .resizable()
//                .scaledToFit()
//                .cornerRadius(8)
//
//
//        }
//        return Image("newsImage")
//
//                    }
            


   
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}
