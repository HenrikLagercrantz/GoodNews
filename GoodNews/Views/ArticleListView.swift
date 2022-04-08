//
//  ArticleView.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2022-03-16.
//  Copyright © 2022 Zelo. All rights reserved.
//

import SwiftUI

struct ArticleListView: View {
    
    @ObservedObject var articleListVM: ArticleListViewModel
    
    var body: some View {
        
     
        List(self.articleListVM.articles, id: \.title) { article in
            NavigationLink {
                ArticleDetailView(article: article)
            } label: {
                ArticleCellView(article: article)
            }
        }
    }
}

struct ArticleCellView: View {
    
    let article: ArticleViewModel
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            article.newsImageView
            
            Text(article.title)
                .font(.custom("Arial",size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
             
                Text(article.description)
                    .font(.custom("Arial",size: 12))
                    .foregroundColor(Color.gray)
        }
       
    }
}



struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
    
        let articleListView = ArticleListViewModel(apiKey: "12sdfs")
        
        return ArticleListView(articleListVM: articleListView)
    }
}




