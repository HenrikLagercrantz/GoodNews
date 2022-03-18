//
//  ArticleView.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2022-03-16.
//  Copyright © 2022 Zelo. All rights reserved.
//

import SwiftUI

struct ArticleListView: View {
    
    let articles: [ArticleViewModel]
    
    var body: some View {
     
        List(self.articles, id: \.title) { article in
            ArticleCellView(article: article)
        
        }
    }
}

struct ArticleCellView: View {
    
    let article: ArticleViewModel
    
    var body: some View {
        VStack() {
            
                
            Image(uiImage: article.newsImage)
                .resizable()
                .scaledToFit()
                               
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
        let url =  "https://www.chicagotribune.com/resizer/qzq_SHrmIMxPCY33VxXv49hl2SU=/1200x0/top/cloudfront-us-east-1.images.arcpublishing.com/tronc/FW27RKMRGGM5GKWHYUSLYBQ7NE.jpg"
        
        let article = Article(title: "title", description: "description,  description description description description description description", urlToImage: url)
        return ArticleListView(articles: [ArticleViewModel(article)])
    }
}




