//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/15/1402 AP.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: PROPERTIES
    var selectedVideo: String
    var videoTitle: String
    // MARK: BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: selectedVideo, fileFormat: "mp4")){
                
            }.overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32,height: 32)
                    .padding(.top,6)
                    .padding(.horizontal,8)
                , alignment: .topLeading
            )
        }//: VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

#Preview {
    VideoPlayerView(selectedVideo: "lion", videoTitle: "Lion")
}
