//
//  ContentView.swift
//  Airlift-Test
//
//  Created by Sikander Zeb on 12/09/2021.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    
    private let threeColumnGrid = [
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
        GridItem(.flexible(minimum: 40)),
    ]
    
    @StateObject var viewModel: HomeViewViewModel
    @State var presentSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: threeColumnGrid) {
                        ForEach(viewModel.images) { post in
                            GridCellView(post: post)
                                .onTapGesture {
                                    viewModel.selectedImage = post
                                    presentSheet.toggle()
                                }
                        }
                        
                    }
                }
            }
            .padding()
            .navigationBarTitle("Image Grid")
            
            .sheet(isPresented: $presentSheet) {
                VStack {
                    KFImage(URL(string: viewModel.selectedImage?.largeImageURL ?? ""))
                        .placeholder({
                            KFImage(URL(string: viewModel.selectedImage?.previewURL ?? ""))
                                .resizable()
                        })
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5)
                }
                .padding()
            }
        }
        
        .onAppear {
            viewModel.fetchImages()
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: .init(dataService: ImageDataService.instance))
    }
}
