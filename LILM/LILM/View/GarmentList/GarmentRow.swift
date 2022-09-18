//
//  GarmentRow.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import SwiftUI

struct GarmentRow: View {
    let garment: Garment
    
    var body: some View {
        HStack {
            GarmentImage(image: Image(garment.imageName))
            VStack(alignment: .leading) {
                Text(garment.title).font(.headline)
                Text("by \(garment.author)").font(.subheadline).foregroundColor(.gray)
                Spacer().frame(height: 15)
                Text("$\(String(garment.price))").font(.title)
            }
        }
    }
}

struct GarmentRow_Previews: PreviewProvider {
    static var previews: some View {
        GarmentRow(garment: Garment(id: 234, title: "Silk Multi-Colored", author: "me dude", price: 45.99, imageName: "one"))
    }
}
