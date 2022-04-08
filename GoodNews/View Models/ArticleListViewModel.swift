//
//  GoodNewsListViewModel.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2022-03-16.
//  Copyright © 2022 Zelo. All rights reserved.
//

import Foundation

class ArticleListViewModel: ObservableObject {
    
    
    var apiKey: String
    var urlString: String
    
    var searchText = ""{
        didSet {
            print("\(searchText)")
        }
    }
    
    
    init(apiKey:String){
        self.apiKey = apiKey
        urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
    }
    
    var date: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MMM-dd"
            return dateFormatter.string(from: Date())
        }
    }

   
    @Published var articles: [ArticleViewModel] = [ArticleViewModel]()
    // propertywrapper
    

    func load() {
   fetchArticles()
    }
    
    private func fetchArticles() {
        WebService().getArticles(url: URL(string: urlString)!) { articles in
            if let articles = articles {
                DispatchQueue.main.async {
                    self.articles = articles.map(ArticleViewModel.init)
                } 
            }
        }
    }
}
