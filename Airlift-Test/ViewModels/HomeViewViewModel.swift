//
//  HomeViewViewModel.swift
//  Airlift-Test
//
//  Created by Sikander Zeb on 12/09/2021.
//

import Foundation

class HomeViewViewModel: ObservableObject {
    
    let dataService: ImageDataServiceProtocol
    @Published var images:[PostModel] = []
    
    var selectedImage: PostModel?
    
    init(dataService: ImageDataServiceProtocol) {
        self.dataService = dataService
    }
    
    func fetchImages() {
        dataService.getImages { images in
            DispatchQueue.main.async {
                self.images = images
            }
            
        }
    }
}
