//
//  MockService.swift
//  LILM
//
//  Created by developer on 9/18/22.
//

import Foundation

class MockService: GarmentService {
    //Mock data
    var garments: [Garment] = [
        Garment(id: 0, title: "The Fellowship of the Ring", author: "J. R. R. Tolkien", price: 180.85, imageName: "one"),
        Garment(id: 1, title: "The Two Towers", author: "J. R. R. Tolkien", price: 110.99, imageName: "two"),
        Garment(id: 2, title: "Homo Deus: A Brief History of Tomorrow", author: "Yuval Noah Harari", price: 190.99, imageName: "three"),
        Garment(id: 3, title: "The 4-Hour Workweek", author: "Timothy Ferriss", price: 160.15, imageName: "four"),
        Garment(id: 4, title: "Man's Search for Meaning", author: "Viktor E. Frankl", price: 120.25, imageName: "five"),
        Garment(id: 5, title: "The Odyssey", author: "Homer", price: 100.99, imageName: "six"),
        Garment(id: 6, title: "Artificial Intelligence: A Modern Approach", author: "Stuart J. Rossell", price: 220.99, imageName: "seven"),
        Garment(id: 7, title: "Creativity, Inc.", author: "Ed Catmull", price: 170.85, imageName: "eight")
    ]
    var garmentsDetail: [GarmentDetail] = [
        GarmentDetail(id: "0", garmentId: 0, designer: "J. R. R. Tolkien", title: "The Fellowship of the Ring", price: 180.85, garmentStyle: [GarmentStyle.jersey, GarmentStyle.alpaca], kind: "Shawl", description: "The geometric pattern on this silk scarf recalls a backgammon playing board, a game that is thought to have originated more than 5,000 years ago, adding a whimsical feel to the design. A dark purple and red trim completes the style.", imageName: "one", isAvailable: false),

        GarmentDetail(id: "2", garmentId: 1, designer: "J. R. R. Tolkien", title: "The Two Towers", price: 110.99, garmentStyle: [GarmentStyle.jersey, GarmentStyle.alpaca], kind: "Shawl", description: "For Exquisite Gucci, symbols speaking to the equestrian roots of the House meet with classic patterns like tartan, creating an unexpected print that defines a selection of silk scarves.", imageName: "two", isAvailable: false),

        GarmentDetail(id: "1", garmentId: 2, designer: "Yuval Noah Harari", title: "Homo Deus: A Brief History of Tomorrow", price: 190.99, garmentStyle: [GarmentStyle.linen], kind: "Neckband",description: "Colorful geometric patterns are presented across a selection of accessories, in a tribute to the House's equestrian heritage. The Double G detail in this harness grid print adds a strong logo feel to this wool shawl.", imageName: "three", isAvailable: false),

        GarmentDetail(id: "1", garmentId: 3, designer: "Timothy Ferriss", title: "The 4-Hour Workweek", price: 160.15, garmentStyle: [GarmentStyle.cashmere], kind: "Scarf",description: "Part of the adidas x Gucci collection, this silk scarf features the Gucci Trefoil print. adidas and Gucci venture into a collection, where the Web juxtaposes with the three white stripes, and the GG monogram combines with the trefoil. Pulling inspiration from the Creative Director’s memories of the '80s and '90s, emblematic House’s motifs mix with those of the historic sportswear brand adidas resulting in a series of hybrid looks.", imageName: "four", isAvailable: false),

        GarmentDetail(id: "1", garmentId: 4, designer: "Viktor E. Frankl", title: "Man's Search for Meaning", price: 120.25, garmentStyle: [GarmentStyle.linen, GarmentStyle.cotton], kind: "Carre",description: "The House presents a whimsical collection of ready-to-wear, shoes and accessories in a colorful palette. As a joyful reinterpretation of Gucci’s heritage, hearts and rhombus motifs appear alongside floral accents imbuing the selection with a romantic feel that celebrates love. This ivory and multicolor wool shawl is decorated with the Interlocking G rhombus print, complete with pink trim.", imageName: "five", isAvailable: false),

        GarmentDetail(id: "1", garmentId: 5, designer: "Homer", title: "The Odyssey", price: 100.99, garmentStyle: [GarmentStyle.jersey, GarmentStyle.linen], kind: "Neckbow",description: "Originally designed by artist Vittorio Accornero for the Princess Grace of Monaco in the 1960s, the botanical Flora print continues to influence the House today. Here the cascade of colorful flowers in contrasting vivid tones appears as a jacquard detail, enriching this turquoise wool blend shawl.", imageName: "six", isAvailable: false),

        GarmentDetail(id: "1", garmentId: 6, designer: "Stuart J. Rossell", title: "Artificial Intelligence: A Modern Approach", price: 220.99, garmentStyle: [GarmentStyle.wool, GarmentStyle.alpaca], kind: "Shawl", description: "This print silk shawl combines two of the House's most distinctive designs into an unexpected and contemporary pattern. The historic Flora motif, first presented by Vittorio Accornero more than 50 years ago, is layered under the vintage Gucci logo–a design inspired by prints from the 1980s.", imageName: "seven", isAvailable: false),

        GarmentDetail(id: "1", garmentId: 7, designer: "Ed Catmull", title: "Creativity, Inc.", price: 170.85, garmentStyle: [GarmentStyle.cashmere, GarmentStyle.wool], kind: "Scarf",description: "Part of a special collection with pastel-hued accents, this wool silk shawl combines two of the House's most distinctive designs. The historic Flora motif, first presented by Vittorio Accornero in the '60s, is layered over the printed GG motif for a modern take on the two archival patterns.", imageName: "eight", isAvailable: false)
    ]
    var cart = Cart(items: [], numberOfItems: 0, total: 0)
    
    func garmentList() -> [Garment] {
        return garments
    }
    
    //Garment details
    func garmentDetails(garmentId: Int) -> GarmentDetail {
        let details = garmentsDetail.first { $0.garmentId == garmentId }
        return details!
    }
    
    func numberofCartItems() -> Int {
        return cart.numberOfItems
    }
    
    func addToCart(garmentId: Int) {
        guard let garment = (garments.first { $0.id == garmentId }) else { return }
        
        //update cart
        cart.numberOfItems += 1
        cart.total += garment.price
        updateItemCart(garment: garment)
    }
    
    func cartItems() -> Cart {
        return cart
    }
    
    func checkout() {
        //checkout means to clear cart
        for item in cart.items {
            garmentAvailable(id: item.item.id)
        }
        cart = Cart(items: [], numberOfItems: 0, total: 0)
    }
}

private extension MockService {
    func garmentAvailable(id: Int) {
        if let row = garmentsDetail.firstIndex(where: {$0.garmentId == id}),
           var garment = garmentsDetail.first(where: {$0.garmentId == id}) {
            garment.isAvailable = true
            garmentsDetail[row] = garment
        }
    }
    
    func updateItemCart(garment: Garment) {
            if let index = (cart.items.firstIndex{ $0.item.id == garment.id }) {
                cart.items[index].units += 1
            } else {
                cart.items.append(Item(id: UUID().uuidString, item: garment, units: 1))
            }
        }
}
