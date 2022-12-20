//
//  PageModel.swift
//  pinch
//
//  Created by MohammadHossein Nejadhendi on 9/29/1401 AP.
//

import Foundation

struct Page : Identifiable{
    let id: Int
    let imageName : String
    
}

extension Page{
    var thumbnailName : String{
        return "thumb-" + imageName
    }
}
