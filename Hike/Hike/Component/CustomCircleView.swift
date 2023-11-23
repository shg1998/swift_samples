//
//  CustomCircleView.swift
//  Hike
//
//  Created by Mohammad hossein Nezhad Hendi on 9/2/1402 AP.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimatedGradiant: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .customIndigoMedium,
                            .customSalmonLight
                        ],
                        startPoint: isAnimatedGradiant ? .topLeading : .bottomLeading,
                        endPoint: isAnimatedGradiant ? .bottomTrailing : .topTrailing)
                )
                .onAppear{
                    withAnimation(
                        .linear(duration: 2.5).repeatForever(autoreverses: true)) {
                        isAnimatedGradiant.toggle()
                    }
                }
            MotionAnimationView()
        }
        .frame(width: 256,height: 256)
        
    }
}

#Preview {
    CustomCircleView()
}
