//
//  GarmentService.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import Foundation

protocol GarmentService {
    //garment list
    func garmentList() -> [Garment]
    
    //garment detail
    func garmentDetails(garmentId: Int) -> GarmentDetail
    func numberofCartItems() -> Int
    func addToCart(garmentId: Int)
    
    //cart
    func cartItems() -> Cart
    func checkout()
}
