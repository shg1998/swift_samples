//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/13/1402 AP.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: PROPERTIES
    let animal: Animal
    // MARK: BODY
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .center,spacing: 19){
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor.frame(height: 6)
                            .offset(y: 23)
                    )
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }.padding(.horizontal)
            }//: VStack
            .navigationBarTitle("Learn about \(animal.name)",displayMode: .inline)
        }//: ScrollView
    }
}
