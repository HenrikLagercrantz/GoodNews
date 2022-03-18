//
//  WebServices.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2022-03-16.
//  Copyright © 2022 Zelo. All rights reserved.
//

import Foundation
import UIKit

class WebService {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let jsonData = data {
                
                do {
                
                    let articleList = try JSONDecoder().decode(ArticleList.self, from: jsonData)
                    completion(articleList.articles)
                    //print(articleList as Any)
                } catch DecodingError.dataCorrupted(let context) {
                    print(context)
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.valueNotFound(let value, let context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.typeMismatch(let type, let context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
              
            }
            
        }.resume()
    }
    
    
    
    func fetchImageWith(_ urlString: String?) -> UIImage{
        if let imageUrl = urlString {
            if let url = URL(string: imageUrl) {
                let data = try? Data(contentsOf: url)
                return UIImage(data: data!)!
            }
        }
        return UIImage(imageLiteralResourceName: "newsImage")
    }
        
     
        
    
    
    
    
    
    
    
    
}
