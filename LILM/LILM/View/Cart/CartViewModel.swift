//
//  CartViewModel.swift
//  LILM
//
//  Created by developer on 9/19/22.
//

import Foundation

class CartViewModel: ViewModel {

    @Published var state: CartState
    private var service: GarmentService

    init(service: GarmentService) {
        let cart = service.cartItems()
        self.state = CartState(cart: cart)
        self.service = service
    }

    func trigger(_ input: CartInput) {
        switch input {
        case .checkout:
            service.checkout()
            state.cart = service.cartItems()
        }
    }
    
}
