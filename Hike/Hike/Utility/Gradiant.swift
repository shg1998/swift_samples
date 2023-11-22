//
//  Gradiant.swift
//  Hike
//
//  Created by Mohammad hossein Nezhad Hendi on 9/1/1402 AP.
//

import Foundation
import SwiftUI

struct GradiantButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,35)
            .background{
                configuration.isPressed ?
                LinearGradient(colors: [.customGrayMedium,.customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
            }.cornerRadius(45)
    }
}
