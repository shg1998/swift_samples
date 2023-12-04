//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Mohammad hossein Nezhad Hendi on 9/13/1402 AP.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed To Load \(file) from bundle :)")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode file from bandle!")
        }
        return loaded
    }
}
