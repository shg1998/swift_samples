//
//  ContentView.swift
//  pinch
//
//  Created by MohammadHossein Nejadhendi on 9/24/1401 AP.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Properties :
    @State private var isAnimating : Bool = false
    @State private var imageScale :CGFloat = 1
    @State private var imageOffset : CGSize = .zero
    
    // MARK: Functions:
    
    func resetImageState(){
        return withAnimation(.spring()){
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                // MARK: - IMAGE :
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .padding()
                    .shadow(color:.red.opacity(0.4), radius: 12, x:2 , y:2)
                    .opacity(isAnimating ? 1 : 0)
                    .scaleEffect(imageScale)
                    .offset(imageOffset)
                //MARK: - 1. TAP GESTURE :
                    .onTapGesture(count: 2) {
                        if imageScale == 1{
                            // for make more animate :)
                            withAnimation(.spring()) {
                                imageScale = 4
                            }
                        }else
                        {
                            resetImageState()
                        }
                    }
                // MARK: - 2. DRAG GESTURE
                    .gesture(
                    DragGesture()
                        .onChanged {
                            value in
                            withAnimation(.linear(duration: 1.2)){
                                imageOffset = value.translation
                            }
                        }
                        .onEnded{
                            _ in
                            if imageScale <=  1 {
                               resetImageState()
                            }
                            
                        }
                    )
            } //:STACK
            .navigationTitle("Pich & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                withAnimation(.linear(duration: 1)){
                    isAnimating = true
                }
            }
        } //: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
