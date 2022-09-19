//
//  CartButtonView.swift
//  LILM
//
//  Created by developer on 9/19/22.
//

import SwiftUI

struct CartButtonView: View {
    var numberOfItems: Int

    var body: some View {
        VStack {
            Image(systemName: "cart")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .bottom)
                .foregroundColor(.black)
                .overlay(ImageOverlay(numberOfItems: numberOfItems), alignment: .center)
            Spacer()
        }
    }


struct ImageOverlay: View {
        var numberOfItems: Int

        var body: some View {
            ZStack {
                Text(String(numberOfItems))
                    .font(.system(size: 13, weight: .bold, design: .serif))
                    .foregroundColor(.black)
                    .padding(1)
            }
        }
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView(numberOfItems: 3)
    }
}
