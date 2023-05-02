//
//  ImageLoader.swift
//  SimpleThreads
//
//  Created by Blaine Beltran on 5/1/23.
//

import UIKit
import AlamofireImage

final class ImageLoader {
    static let shared = ImageLoader()
    private let allowedDiskSize = 512 * 1024 * 1024 * 1024
    private let allowedMemorySpace = 512 * 1024 * 1024 * 1024
    private lazy var cache: URLCache = {
       return URLCache(memoryCapacity: allowedMemorySpace, diskCapacity: allowedDiskSize)
    }()
    
    var imageCache = NSCache<NSString, UIImage>()
    var count = 1
    
    func fetchImage(from urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else {
            print("Unable to create url from string")
            throw URLError(.badURL)
        }
//        let request = URLRequest(url: url)
//
//        if let cachedData = cache.cachedResponse(for: request) {
//            return UIImage(data: cachedData.data) ?? UIImage()
//        }
        if let image = imageCache.object(forKey: NSString(string: urlString)) {
            return image
        }
      
        
        do {
            print("made request to server \(count) times")
//            let sessionConfig = URLSessionConfiguration.default
//            sessionConfig.requestCachePolicy = .returnCacheDataElseLoad
//            sessionConfig.urlCache = cache
//            let urlSession = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: .main)
            let (data, _) = try await URLSession.shared.data(from: url)
//            let cachedData = CachedURLResponse(response: response, data: data)
//            cache.storeCachedResponse(cachedData, for: request)
            guard let image = UIImage(data: data) else { fatalError() }
            count += 1
            imageCache.setObject(image, forKey: NSString(string: urlString))
            return image
        } catch {
            throw error
        }
    }
}
