//
//  ItemDetail.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import Foundation

struct GarmentDetail {
    var id: String
    var bookId: Int
    var author: String
    var title: String
    var price: Double
    var genre: [Genre]
    var kind: String
    var description: String
    var imageName: String
    var isAvailable: Bool
}
