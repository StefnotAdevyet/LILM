//
//  GarmentDetailLabel.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import SwiftUI

struct GarmentDetailLabel: View {
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

struct GarmentDetailLabel_Previews: PreviewProvider {
    static var previews: some View {
        GarmentDetailLabel(text: "fantasy")
    }
}
