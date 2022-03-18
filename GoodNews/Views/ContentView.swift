//
//  ContentView.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2020-07-15.
//  Copyright © 2020 Zelo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var articleListVM = ArticleListViewModel()

    init(){
        articleListVM.load()
    }

    var body: some View {
        NavigationView{
            
            ZStack(alignment: .leading) {
       
                Text(articleListVM.date)
                    .font(.custom("Arial", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -300)
                
                ArticleListView(articles: self.articleListVM.articles)
                    .offset(y:15)
            }
            .navigationBarTitle("Articles")
        }
        .edgesIgnoringSafeArea(Edge.Set(.bottom))
   
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
