//
//  ItemToMatch.swift
//  MatchingGame
//
//  Created by Russell Gordon on 2022-05-04.
//

import Foundation

struct ItemToMatch: Identifiable, Codable {
    
    // MARK: Stored properties
    let description: String
    let image: String
    var id: Int

}

let testItem = ItemToMatch(description: "cherry",
                           image: "cherry",
                           id: 31)

let testItems = [
    
    ItemToMatch(description: "mushroom", image: "mushroom", id: 21)
    
    ,
    
    ItemToMatch(description: "milkshake", image: "milkshake", id: 22)
    
    ,
    
    ItemToMatch(description: "lemon", image: "lemon", id: 23)
    
    ,
    
    ItemToMatch(description: "green pepper", image: "green-pepper", id: 24)
    
    ,
    
    ItemToMatch(description: "corn", image: "corn", id: 30)
    
    ,
    
    ItemToMatch(description: "cherry", image: "cherry", id: 31)
    
    ,
    
    ItemToMatch(description: "celery", image: "celery", id: 32)
    
    ,
    
    ItemToMatch(description: "carrot", image: "carrot", id: 33)
    
    ,
]
