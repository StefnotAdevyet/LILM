//
//  GarmentDetailButton.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import SwiftUI

struct GarmentDetailButton: View {
    var text: String
       var buttonColor: Color

       var body: some View {
           HStack {
               Text(text)
                   .fontWeight(.semibold)
           }
           .frame(width: 200)
           .padding()
           .foregroundColor(.white)
           .background(buttonColor)
           .cornerRadius(40)
       }
   }

struct GarmentDetailButton_Previews: PreviewProvider {
    static var previews: some View {
        GarmentDetailButton(text: "Buy", buttonColor: .blue)
    }
}
