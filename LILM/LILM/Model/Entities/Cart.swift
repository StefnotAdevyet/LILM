//
//  Cart.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import Foundation

struct Item: Identifiable {
    var id: String
    var item: Garment
    var units: Int
}

struct Cart {
    var items: [Item]
    var numberOfItems: Int
    var total: Double
}
