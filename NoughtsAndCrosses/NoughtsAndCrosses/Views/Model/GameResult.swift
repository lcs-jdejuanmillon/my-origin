//
//  GameResult.swift
//  NoughtsAndCrosses
//
//  Created by Russell Gordon on 2022-05-03.
//

import Foundation

/// Used to save the result of a completed game.
/// - Tag: nac_game_result
struct GameResult: Identifiable {

    // Allow each result to be uniquely identified
    let id = UUID()
    
    // Outcome
    //
    // Could be:
    //      "⭘"
    //      "✕"
    //      "Draw"
    let outcome: String
    
    // How many turns did it take?
    let turnsTotal: Int

    // The game board...
    // Top row
    let upperLeft: String
    let upperMiddle: String
    let upperRight: String
    // Middle row
    let middleLeft: String
    let middleMiddle: String
    let middleRight: String
    // Bottom row
    let bottomLeft: String
    let bottomMiddle: String
    let bottomRight: String

}

// Test result for Xcode Previews use
let testGameResult = GameResult(outcome: "⭘",
                                turnsTotal: 5,
                                upperLeft: "⭘",
                                upperMiddle: "✕",
                                upperRight: "✕",
                                middleLeft: "",
                                middleMiddle: "⭘",
                                middleRight: "",
                                bottomLeft: "",
                                bottomMiddle: "",
                                bottomRight: "⭘")
