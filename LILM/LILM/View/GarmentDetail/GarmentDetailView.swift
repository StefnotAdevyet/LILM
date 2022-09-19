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
        VStack {
            GarmentImage(image: Image(viewModel.state.garmentDetail.imageName))
            Spacer()
                .frame(height: 30)
            Text(viewModel.state.garmentDetail.author)
                .foregroundColor(.gray)
            Text(viewModel.state.garmentDetail.title)
                .font(.system(size: 24, weight: .semibold))
                .padding([.leading, .trailing], 20)
            Spacer()
                .frame(height: 20)
            Text(viewModel.state.garmentDetail.description)
                .lineLimit(4)
                .padding([.leading, .trailing], 20)
                .lineSpacing(6)
                .foregroundColor(.gray)
            Spacer()
                .frame(height:20)
            HStack(spacing: 20) {
                ForEach(0..<viewModel.state.garmentDetail.garmentStyle.count, id: \.self) { index in
                    GarmentDetailLabel(text: self.viewModel.state.garmentDetail.garmentStyle[index].description)
                }
                Text(viewModel.state.garmentDetail.kind)
            }
            Button(action: {
                self.showAlert = true
            }) {
                GarmentDetailButton(text: "Buy for $\(viewModel.state.garmentDetail.price)", buttonColor: .black)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Added to cart!"), message: Text("You're ready to proceed to checkout and complete your order!"), dismissButton: .default(Text("Done!")))
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.showModal = true
                }) {
                    CartButtonView(numberOfItems: self.viewModel.state.cartItems)
                }.sheet(isPresented: self.$showModal, onDismiss: { self.reload() }) {
                    CartView(service: self.viewModel.state.service, showModal: self.$showModal)
                })
            .navigationBarTitle(Text(""), displayMode: .inline)
            

        }
        
    }
}

private extension GarmentDetailView {
    func addToCart() {
        viewModel.trigger(.addGarmentToCart)
    }

    func reload() {
        viewModel.trigger(.reloadState)
    }
}

struct GarmentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GarmentDetailView(service: MockService(), garmentId: 6)
    }
}
