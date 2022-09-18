//
//  MockService.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import Foundation

class MockService: GarmentService {
    //Mock data
    var garments: [Garment] = []
    var garmentsDetail: [GarmentDetail] = []
    var cart = Cart(items: [], numberOfItems: 0, total: 0)
    
    func garmentList() -> [Garment] {
        <#code#>
    }
    
    //Garment details
    func garmentDetails(garmentId: Int) -> GarmentDetail {
        let details = garmentsDetail.first { $0.bookId == garmentId }
        return details!
    }
    
    func numberofCartItems() -> Int {
        return cart.numberOfItems
    }
    
    func addToCart(garmentId: Int) {
        guard let garment = (garments.first { $0.id == garmentId }) else { return }
        
        //update cart
        cart.numberOfItems += 1
        cart.total += garment.price
        updateItemCart(garment: garment)
    }
    
    func cartItems() -> Cart {
        return cart
    }
    
    func checkout() {
        //checkout means to clear cart
        for item in cart.items {
            garmentAvailable(id: item.item.id)
        }
        
        cart = Cart(items: [], numberOfItems: 0, total: 0)
    }
}
