//
//  CustomButtonView.swift
//  Hike
//
//  Created by Mohammad hossein Nezhad Hendi on 9/1/1402 AP.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                                .white,
                                .customGreenLight,
                                .customGreenMedium
                        ], 
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            Circle()
                .stroke(LinearGradient(
                    colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom
                ),lineWidth : 3)
            
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
                )
        }
        .frame(width: 58,height: 58)
    }
}

#Preview {
    CustomButtonView()
        .previewLayout(.sizeThatFits)
        .padding()
}
