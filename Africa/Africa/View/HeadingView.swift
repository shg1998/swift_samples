//
//  HeadingView.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/13/1402 AP.
//

import SwiftUI

struct HeadingView: View {
    // MARK: PROPERTIES
    var headingImage: String
    var headingText: String
    
    // MARK: BODY
    var body: some View {
        HStack{
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }//: HStack
        .padding(.vertical)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in pictures")
}
