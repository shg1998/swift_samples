//
//  VideoListItem.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/15/1402 AP.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: PROPERTIES
    let video: Video
    
    // MARK: BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }//: ZStack
            
            VStack(alignment: .leading){
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//: VStack
        }//: HStack
    }
}

#Preview {
    VideoListItemView(video: Video(id: "", name: "", headline: ""))
}
