//
//  GoodNewsListViewModel.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2022-03-16.
//  Copyright © 2022 Zelo. All rights reserved.
//

import Foundation

class ArticleListViewModel: ObservableObject {
    
    var date: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MMM-dd"
            return dateFormatter.string(from: Date())
        }
    }

    @Published var articles: [ArticleViewModel] = [ArticleViewModel]() // propertywrapper
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=be11282fb592403d88875fe28d5f9afa")!
    
    func load() {
        fetchArticles()
    }
    
    private func fetchArticles() {
        WebService().getArticles(url: url) { articles in
            if let articles = articles {
                DispatchQueue.main.async {
                    self.articles = articles.map(ArticleViewModel.init)
                }
                
            }
        }
    }
}
