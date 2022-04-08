//
//  ArticleDetailView.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2022-03-19.
//  Copyright © 2022 Zelo. All rights reserved.
//

import SwiftUI
import SwiftUIFlowLayout

struct ArticleDetailView: View {
   
    var article: ArticleViewModel
    
    var body: some View {
        ScrollView {

                    article.newsImageView

                    VStack(alignment: .leading) {
                        Text(article.name)
                        .foregroundColor(.red)
                        .font(.custom("Arial",size: 10))
                        
                        Text(article.title)
                            .font(.custom("Arial",size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                        
                            Spacer()
                            
                        VStack(alignment: .leading) {
                            Text(article.author)
                                .foregroundColor(.gray)
                           // Spacer()
                           
                        }
                        .font(.custom("Arial",size: 10))
                        .foregroundColor(.secondary)

                        Divider()

                        Text(article.description)
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                       // Divider()
                        Spacer()
 
                        Text( self.article.content)
                            .font(.body)
                        Spacer()
                        let urlToArticle = "\(article.url)"
  
                        HyperlinkText(html: "<b>Read the whole article online at </b> <a href=\(urlToArticle)</a> \(article.name )")
 
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.top, 12)
                    .padding(.bottom, 25)
                    .padding(.horizontal, 10)

                    Spacer()
                }
        
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let url =  "https://www.chicagotribune.com/resizer/qzq_SHrmIMxPCY33VxXv49hl2SU=/1200x0/top/cloudfront-us-east-1.images.arcpublishing.com/tronc/FW27RKMRGGM5GKWHYUSLYBQ7NE.jpg"
        let source = Source(id: "id", name: nil)
        
        
        let article = Article(title: "Title", description: "Description", urlToImage: url, author: "author", url: "url to article", publishedAt: "date", content: "content", source: source)
        
        let articleViewModel = ArticleViewModel(article)
        
        
        ArticleDetailView(article: articleViewModel)
    }
}
