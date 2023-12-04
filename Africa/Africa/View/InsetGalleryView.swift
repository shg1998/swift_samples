//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/13/1402 AP.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: PROPERTIES
    let animal: Animal
    //MARK: BODY
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment: .center,spacing: 12) {
                ForEach(animal.gallery,id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(13)
                }
            }//: HStack
        }//: ScrollView
    }
}

#Preview {
    InsetGalleryView(animal: Animal(id: "dkkdjd", name: "dkhdkd", headline: "khdkhd", description: "kdhkdh", link: "ldhlhd", image: "khdkhd", gallery: ["khdkhd","dhkdhkhd"], fact: ["dkhkhkdh","kdhkdhkdhkhd"]))
        .previewLayout(.sizeThatFits)
        .padding()
}
