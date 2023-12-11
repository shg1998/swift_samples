//
//  MapView.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/13/1402 AP.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    // MARK: - BODY
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations,
            annotationContent: {item in
//            MapPin(coordinate: item.location, tint: .red)
//            MapMarker(coordinate: item.location,tint: .accentColor)
//            MapAnnotation(coordinate: item.location, content: {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 30,height: 30)
//            })
            MapAnnotation(coordinate: item.location, content: {
                MapAnnotationView(location: item)
            })
        })//: MAP
        .overlay(
            HStack(alignment: .center, spacing: 13) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48,height: 48,alignment: .center)
                
                VStack (alignment: .leading,spacing: 3){
                    HStack{
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//: HStack
                    Divider()
                    
                    HStack{
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//: HStack
                }//: VStack
            }//: HStack
            .padding(.vertical,12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.62)
            )
            .padding()
            ,alignment: .top
            )
    }
}

#Preview {
    MapView()
}
