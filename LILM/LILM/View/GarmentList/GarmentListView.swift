//
//  GarmentListView.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import SwiftUI


struct GarmentListView: View {
    @ObservedObject var viewModel: AnyViewModel<GarmentListState, Never>
    
    var body: some View {
        NavigationView {
            List(viewModel.state.garments) { garment in
                NavigationLink(destination: GarmentDetailView()) {
                    GarmentRow(garment: garment)
                }

            }
            .navigationTitle("Garment List")
        }
    }
}

struct GarmentListView_Previews: PreviewProvider {
    
    static var previews: some View {
        let viewModel = AnyViewModel(GarmentListViewModel(service: MockService()))
        return GarmentListView(viewModel: viewModel)
    }
}
