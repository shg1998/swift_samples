//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/13/1402 AP.
//

import SwiftUI

struct AnimalListItemView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    // MARK: - BODY
    var body: some View {
        HStack (alignment: .center,spacing: 15, content: {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90,height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading,spacing: 9) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing,8)
            }//: Vstack
        }) //: Hstack
    }
}
