//
//  ImageCache.swift
//  GoodNews
//
//  Created by Henrik Lagercrantz on 2022-03-20.
//  Copyright © 2022 Zelo. All rights reserved.
//

import UIKit

class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}







