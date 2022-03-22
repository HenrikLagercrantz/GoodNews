//
//  ContentView.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2020-07-15.
//  Copyright © 2020 Zelo. All rights reserved.
//

import SwiftUI
//import XCTest

struct ContentView: View {
    
    @ObservedObject private var articleListVM = ArticleListViewModel(apiKey: "be11282fb592403d88875fe28d5f9afa")

    init(){
        articleListVM.load()
      
    }
    
    @State var searchText = "" {
        didSet {
            print(searchText)
        }
    }
    let searchString:String = "Enter search"
    var body: some View {
        
        NavigationView {
        
            VStack(alignment: .leading) {
                
                
                VStack {
                    HStack {
                        Spacer()
                      
                       Text("Region:      🇺🇸")
                            .font(.custom("Arial", size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
                    }
                    HStack{
                        Text(articleListVM.date)
                            .font(.custom("Arial", size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
                        Spacer()
                        
                        Text("Top Headlines")
                            .font(.custom("Arial", size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
                    }
                }
                   
                HStack {
                    TextField(searchString, text: $searchText)
                                 .padding(.horizontal, 40)  // text in textfield
                                 .frame(width: UIScreen.main.bounds.width - 30, height: 45, alignment: .leading)
                               
                                .background(Color(#colorLiteral(red: 0.9294475317, green: 0.9239223003, blue: 0.9336946607, alpha: 1)))
                              
                                 .cornerRadius(10)
                                 .overlay(
                                     HStack {
                                         Image(systemName: "magnifyingglass")
                                             .foregroundColor(.gray)
                                             .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                             .padding(.leading, 10)
                                     }
                                 )
                         }.padding().padding(.top, 4)
                
                
                
                ArticleListView(articleListVM: self.articleListVM)
             
            }
            .navigationBarTitle("Todays News", displayMode: .large)
           
            
            
       } .navigationViewStyle(.stack)
          
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
