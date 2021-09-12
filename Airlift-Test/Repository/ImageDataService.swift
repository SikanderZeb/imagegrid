//
//  ImageDataService.swift
//  Airlift-Test
//
//  Created by Sikander Zeb on 12/09/2021.
//

import Foundation
import SwiftyJSON
import ObjectMapper

protocol ImageDataServiceProtocol {
    func getImages(completionHandler: @escaping([PostModel]) -> Void)
}

class ImageDataService: ImageDataServiceProtocol {
    
    let sessionManager: URLSession = URLSession.shared
    public static var instance : ImageDataService {
        ImageDataService()
    }
    
    func getImages(completionHandler: @escaping([PostModel]) -> Void) {
        let url = "\(Constants.SERVER_URL)?key=\(Constants.PIXABAY_KEY)&q=yellows&image_type=photo"
        if let url = URL(string: url) {
            sessionManager.dataTask(with: url) { data, res, error in
                guard error == nil, let data = data else {
                    print(error!)
                    return
                }
                do {
                    let json = try JSON(data: data)
                    if let hits = json.dictionaryObject?["hits"] as? [Any] {
                        if let posts = Mapper<PostModel>().mapArray(JSONObject: hits) {
                            completionHandler(posts)
                        }
                    }
                } catch {
                    print("Error during JSON serialization: \(error.localizedDescription)")
                }
            }.resume()
            
        }
        
    }
}
