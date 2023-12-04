//
//  ContentView.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/13/1402 AP.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    // MARK: BODY
    var body: some View {
        NavigationView {
            List{
                CoverImageView()
                    .frame(height: 270)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)){
                        AnimalListItemView(animal: animal)
                    }
                }
            }//: List
            .navigationBarTitle("Africa", displayMode: .large)
        } //: NavigationView
    }
}

#Preview {
    ContentView()
}
