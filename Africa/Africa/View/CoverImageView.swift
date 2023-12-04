//
//  CoverImageView.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/13/1402 AP.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: - BODY
    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            } //: Foreach
        } //: TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: - PREVIEWE
#Preview {
    CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
}
