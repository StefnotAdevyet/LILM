//
//  GarmentDetailViewModel.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import Foundation

class GarmentDetailViewModel: ViewModel {
    @Published var state: GarmentDetailState
    
    init(service: GarmentService, id: Int) {
        let detail = service.garmentDetails(garmentId: id)
        let items = service.numberofCartItems()
        
        state = GarmentDetailState(service: service, garmentDetail: detail, cartItems: items)
    }
    
    func trigger(_ input: GarmentDetailInput) {
        switch input {
        case .addGarmentToCart:
            state.service.addToCart(garmentId: state.garmentDetail.garmentId)
            state.cartItems = state.service.numberofCartItems()
        case .reloadState:
            state.garmentDetail = state.service.garmentDetails(garmentId: state.garmentDetail.garmentId)
            state.cartItems = state.service.numberofCartItems()
        }
    }
    
}
