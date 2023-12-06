//
//  InsetMapView.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/15/1402 AP.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // MARK: PROPERTIES
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    // MARK: BODY
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView()){
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }//: HStack
                    .padding(.vertical,10)
                    .padding(.horizontal,14)
                    .background(
                        Color.black
                            .opacity(0.45)
                            .cornerRadius(9)
                    )
                } //: NavigationLink
                    .padding(12),alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(11)
    }
}

#Preview {
    InsetMapView()
}
