//
//  GarmentDetailView.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import SwiftUI

struct GarmentDetailState {
    var service: GarmentService
    var garmentDetail: GarmentDetail
    var cartItems: Int
}

enum GarmentDetailInput {
    case addGarmentToCart
    case reloadState
}

struct GarmentDetailView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GarmentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GarmentDetailView()
    }
}