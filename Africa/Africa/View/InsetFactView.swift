//
//  InsetFactView.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/15/1402 AP.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: PROPERTIES
    let animal: Animal
    
    // MARK: BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//: TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 149, idealHeight: 169,maxHeight: 180)
        }//: GroupBox
    }
}

