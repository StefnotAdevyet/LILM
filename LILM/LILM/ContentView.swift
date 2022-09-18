//
//  ContentView.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import SwiftUI

struct ContentView: View {
    let viewModel = AnyViewModel(GarmentListViewModel(service: MockService()))
    var body: some View {
        GarmentListView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
