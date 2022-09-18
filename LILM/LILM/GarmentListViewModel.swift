//
//  GarmentListViewModel.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import Foundation

class GarmentListViewModel: ViewModel {
    
    @Published var state: GarmentListState
    
    init(service: GarmentService) {
        let garments = MockService().garmentList()
        self.state = GarmentListState.init(service: service, garments: garments)
    }
    
    func trigger(_ input: Never) {  }
    
}
