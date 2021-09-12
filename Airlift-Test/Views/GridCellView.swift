//
//  GridCellView.swift
//  Airlift-Test
//
//  Created by Sikander Zeb on 12/09/2021.
//

import SwiftUI
import Kingfisher
struct GridCellView: View {
    let post: PostModel
    var body: some View {
        ZStack {
            KFImage(URL(string: post.previewURL))
                .placeholder({
                    Image(systemName: "photo")
                        .resizable()
                })
                .resizable()
                .cornerRadius(5)
        }
    }
}

struct GridCellView_Previews: PreviewProvider {
    static var previews: some View {
        GridCellView(post: PostModel(JSONString: "")!)
    }
}
