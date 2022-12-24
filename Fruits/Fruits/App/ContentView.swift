//
//  ContentView.swift
//  Fruits
//
//  Created by MohammadHossein Nejadhendi on 10/3/1401 AP.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            FruitCardView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
