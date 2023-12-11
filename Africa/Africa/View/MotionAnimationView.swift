//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/20/1402 AP.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @State private var randomCircle = Int.random(in: 10...16)
    @State private var isAnimating : Bool = false
    // MARK: - FUNCTIONS
    func randomCoordinate(max: CGFloat) -> CGFloat{
        return CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 15...300))
    }
    
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomSpeed() -> Double{
        return Double(Double.random(in: 0.02...1.0))
    }
    
    func randomDelay() -> Double{
        return Double(Double.random(in: 0...2.0))
    }
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.16)
                        .frame(width: randomSize(),height: randomSize(),alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.48, damping: 0.48)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                                .speed(2)
                                .delay(1)
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }
            }//: ZStack
            .drawingGroup()
        }//: GeometryReader
    }
}

#Preview {
    MotionAnimationView()
}
