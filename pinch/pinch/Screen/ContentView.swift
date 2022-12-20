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
    @State private var isDrawerOpen : Bool = true
    
    let pages : [Page] = pagesData
    @State private var pageIndex : Int = 1
    
    // MARK: Functions:
    
    func resetImageState(){
        return withAnimation(.spring()){
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    func currentPage() -> String{
        return pages[pageIndex - 1].imageName
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.clear
                // MARK: - IMAGE :
                Image(currentPage())
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
                // MARK: Magnification
                    .gesture(
                        MagnificationGesture()
                            .onChanged{value in
                                withAnimation(.linear(duration: 1.5)){
                                    if imageScale >= 1 && imageScale <= 5{
                                        imageScale = value
                                    }
                                    else if imageScale > 5{
                                        imageScale = 5
                                    }
                                    else
                                    {
                                        imageScale = 1
                                    }
                                }
                            }
                            .onEnded{_ in
                                if imageScale > 5{
                                    imageScale = 5
                                }
                                else if imageScale <= 1 {
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
            // MARK: Info Panel
            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top,30)
            ,alignment: .top
            )
            // MARK: Controls
            .overlay(
                Group{
                    HStack{
                        // Scale down
                        Button{
                            // some action
                            withAnimation(.spring()){
                                if imageScale > 1 {
                                    imageScale -= 1
                                }
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                        } label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        
                        // reset
                        
                        Button{
                            // some action
                            resetImageState()
                        } label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        // scale up
                        Button{
                            // some action
                            withAnimation(.spring())
                            {
                                if imageScale < 5 {
                                    imageScale += 1
                                }
                                if imageScale > 5 {
                                    imageScale = 5
                                }
                            }
                        } label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                        
                    } //: Controls
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                }
                    .padding(.bottom,25)
                ,alignment: .bottom
            )
            // MARK: Drawer
            .overlay(
                HStack(spacing: 12 ){
                    // drawer Handle
                    Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture {
                            withAnimation(.easeOut){
                                isDrawerOpen.toggle()
                            }
                        }
                    // thumbnails
                    
                    ForEach(pages) { page in
                        Image(page.thumbnailName)
                            .resizable()
                            .scaledToFit()
                            .frame(width:80)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                            .animation(.easeOut(duration: 0.5) , value : isDrawerOpen)
                            .onTapGesture{
                                withAnimation(.spring()){
                                    pageIndex = page.id
                                }
                            }
                    }
                    
                    Spacer()
                }// Drawer
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width:260)
                    .padding(.top,UIScreen.main.bounds.height / 20)
                    .offset(x: isDrawerOpen ? 20 : 215)
                ,alignment: .topTrailing
                
            )
        } //: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
