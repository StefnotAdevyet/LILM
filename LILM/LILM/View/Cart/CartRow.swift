//
//  CartRow.swift
//  LILM
//
//  Created by developer on 9/19/22.
//

import SwiftUI

struct CartRow: View {
    var item: Item

    var body: some View {
        HStack {
            GarmentImage(image: Image(item.item.imageName))

            VStack(alignment: .leading) {
                Text(item.item.title)
                Spacer().frame(height: 15)
                Text("$" + String(item.item.price)).font(.system(size: 18)).bold()
            }.padding([.top, .bottom])
                .frame(width: 150)

            GarmentDetailLabel(text: "x" + String(item.units))
                .padding(.leading, 20)
        }
    }
}

struct CartRow_Previews: PreviewProvider {
    static var previews: some View {
        let garment = Garment(id: 0, title: "The Fellowship of the Ring", author: "J. R. R. Tolkien", price: 18.85, imageName: "one")
        let item = Item(id: "0", item: garment, units: 2)
        return CartRow(item: item)
    }
}
