//
//  Airlift_TestApp.swift
//  Airlift-Test
//
//  Created by Sikander Zeb on 12/09/2021.
//

import SwiftUI

@main
struct Airlift_TestApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: .init(dataService: ImageDataService.instance))
        }
    }
}
