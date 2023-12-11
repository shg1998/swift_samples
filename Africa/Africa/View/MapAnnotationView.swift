//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/20/1402 AP.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTIES
    var location: NationalParkLocation
    @State private var animation: Double = 0.0
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 55,height: 55,alignment: .center)
            
            Circle()
                .stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52,height: 52,alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 45,height: 45,alignment: .center)
                .clipShape(Circle())
        }//: ZStack
        .onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}

#Preview {
    MapAnnotationView(location: NationalParkLocation(id: "", name: "", image: "", latitude: 2, longitude: 2))
        .previewLayout(.sizeThatFits)
        .padding()
}
