//
//  VideoModel.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/15/1402 AP.
//

import Foundation


struct Video: Codable,Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Properties
    var thumbnail: String {
        "video-\(self.id)"
    }
}
