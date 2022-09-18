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
        Garment(id: 0, title: "The Fellowship of the Ring", author: "J. R. R. Tolkien", price: 18.85, imageName: "fellow"),
        Garment(id: 1, title: "The Two Towers", author: "J. R. R. Tolkien", price: 11.99, imageName: "twoTowers"),
        Garment(id: 2, title: "Homo Deus: A Brief History of Tomorrow", author: "Yuval Noah Harari", price: 19.99, imageName: "homoDeus"),
        Garment(id: 3, title: "The 4-Hour Workweek", author: "Timothy Ferriss", price: 16.15, imageName: "the4Hours"),
        Garment(id: 4, title: "Man's Search for Meaning", author: "Viktor E. Frankl", price: 12.25, imageName: "manSearch"),
        Garment(id: 5, title: "The Odyssey", author: "Homer", price: 10.99, imageName: "odyssey"),
        Garment(id: 6, title: "Artificial Intelligence: A Modern Approach", author: "Stuart J. Rossell", price: 22.99, imageName: "ai"),
        Garment(id: 7, title: "Creativity, Inc.", author: "Ed Catmull", price: 17.85, imageName: "creativity")
    ]
    var garmentsDetail: [GarmentDetail] = [
        GarmentDetail(id: "0", bookId: 0, author: "J. R. R. Tolkien", title: "The Fellowship of the Ring", price: 18.85, garmentStyle: [GarmentStyle.fantasy, GarmentStyle.action], kind: "Novel",description: "The Fellowship of the Ring is the first of three volumes in The Lord of the Rings, an epic set in the fictional world of Middle-earth. The Lord of the Rings is an entity named Sauron, the Dark Lord, who long ago lost the One Ring that contains much of his power. His overriding desire is to reclaim the Ring and use it to enslave all of Middle-earth.", imageName: "fellow", isAvailable: false),

        GarmentDetail(id: "2", bookId: 1, author: "J. R. R. Tolkien", title: "The Two Towers", price: 11.99, garmentStyle: [GarmentStyle.fantasy, GarmentStyle.action], kind: "Novel", description: "The Fellowship was scattered. Some were bracing hopelessly for war against the ancient evil of Sauron. Some were contending with the treachery of the wizard Saruman. Only Frodo and Sam were left to take the accursed Ring of Power to be destroyed in Mordor–the dark Kingdom where Sauron was supreme. Their guide was Gollum, deceitful and lust-filled, slave to the corruption of the Ring.", imageName: "twoTowers", isAvailable: false),

        GarmentDetail(id: "1", bookId: 2, author: "Yuval Noah Harari", title: "Homo Deus: A Brief History of Tomorrow", price: 19.99, garmentStyle: [GarmentStyle.history], kind: "Discussion",description: "Yuval Noah Harari envisions a near future in which we face a new set of challenges. Homo Deus explores the projects, dreams and nightmares that will shape the twenty-first century and beyond – from overcoming death to creating artificial life.", imageName: "homoDeus", isAvailable: false),

        GarmentDetail(id: "1", bookId: 3, author: "Timothy Ferriss", title: "The 4-Hour Workweek", price: 16.15, garmentStyle: [GarmentStyle.present], kind: "Lifestyle",description: "Forget the old concept of retirement and the rest of the deferred-life plan - there is no need to wait and every reason not to, especially in unpredictable economic times. Whether your dream is escaping the rat race, experiencing high-end world travel, earning a monthly five-figure income with zero management, or just living more and working less, this book is the blueprint.", imageName: "the4Hours", isAvailable: false),

        GarmentDetail(id: "1", bookId: 4, author: "Viktor E. Frankl", title: "Man's Search for Meaning", price: 12.25, garmentStyle: [GarmentStyle.history, GarmentStyle.drama], kind: "Psychology",description: "Psychiatrist Viktor Frankl's memoir has riveted generations of readers with its descriptions of life in Nazi death camps and its lessons for spiritual survival. Between 1942 and 1945 Frankl labored in four different camps, including Auschwitz, while his parents, brother, and pregnant wife perished.", imageName: "manSearch", isAvailable: false),

        GarmentDetail(id: "1", bookId: 5, author: "Homer", title: "The Odyssey", price: 10.99, garmentStyle: [GarmentStyle.fantasy, GarmentStyle.history], kind: "Novel",description: "After enduring the Trojan War, Odysseus begins the treacherous journey home to Ithaca. On the way, he faces ravenous monsters and vengeful gods. But the real battle awaits, as his kingdom is under siege by unruly suitors vying for his wife’s hand—and his son’s head. To reclaim his throne and save his family, Odysseus must rely on his wits…and help from the unpredictable gods.", imageName: "odyssey", isAvailable: false),

        GarmentDetail(id: "1", bookId: 6, author: "Stuart J. Rossell", title: "Artificial Intelligence: A Modern Approach", price: 22.99, garmentStyle: [GarmentStyle.scienceFiction, GarmentStyle.present], kind: "AI", description: "The long-anticipated revision of this best-selling text offers the most comprehensive, up-to-date introduction to the theory and practice of artificial intelligence.", imageName: "ai", isAvailable: false),

        GarmentDetail(id: "1", bookId: 7, author: "Ed Catmull", title: "Creativity, Inc.", price: 17.85, garmentStyle: [GarmentStyle.business, GarmentStyle.economics], kind: "Print",description: "This is the story behind the company that changed animation forever. Here, the founder of Pixar reveals the ideas and techniques that have made Pixar one of the most widely admired creative businesses, and one of the most profitable.", imageName: "creativity", isAvailable: false)
    ]
    var cart = Cart(items: [], numberOfItems: 0, total: 0)
    
    func garmentList() -> [Garment] {
        return [Garment]()
    }
    
    //Garment details
    func garmentDetails(garmentId: Int) -> GarmentDetail {
        let details = garmentsDetail.first { $0.bookId == garmentId }
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
        //updateItemCart(garment: garment)
    }
    
    func cartItems() -> Cart {
        return cart
    }
    
    func checkout() {
        //checkout means to clear cart
        for item in cart.items {
            //garmentAvailable(id: item.item.id)
        }
        
        cart = Cart(items: [], numberOfItems: 0, total: 0)
    }
}
