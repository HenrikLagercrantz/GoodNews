//
//  URLImageView.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2022-03-20.
//  Copyright © 2022 Zelo. All rights reserved.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .resizable()
            .scaledToFit()
            .cornerRadius(8)
    }
    
    static var defaultImage = UIImage(named: "newsImage")
}
