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
    @ObservedObject var viewModel: AnyViewModel<GarmentDetailState, GarmentDetailInput>
    
    @State private var showModal = false
    @State private var showAlert = false
    
    init(service: GarmentService, garmentId: Int) {
        self.viewModel = AnyViewModel(GarmentDetailViewModel(service: service, id: garmentId))
    }

    var body: some View {
        Text(viewModel.state.garmentDetail.title)
    }
}

struct GarmentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GarmentDetailView(service: MockService(), garmentId: 0)
    }
}
