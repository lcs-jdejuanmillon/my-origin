//
//  TileView.swift
//  NoughtsAndCrosses
//
//  Created by Russell Gordon on 2022-05-03.
//
//

import SwiftUI

/// - Tag: tile_view
struct TileView: View {
    
    // MARK: Stored properties
    
    // Receives the connection to a source of truth
    // in the calling view.
    // When state changes here, it's new value is
    // sent there to be saved.
    @Binding var state: String
    let gameStillGoing: Bool
    // Which player tapped this tile?
    let player: String
    
    // Connect to property on calling view.
    // Allows turn to be advanced.
    @Binding var turn: Int
    
    // MARK: Computed property
    var body: some View {
        Text(state)
            .font(.largeTitle)
            .frame(width: 50, height: 50)
            .border(Color.black, width: 3)
            // Ensure the "hit box" is the entire view
            // (Normally transparent parts of view cannot be tapped)
            .contentShape(Rectangle())
            // Taps on view uses the tile
            .onTapGesture {
                
                // Make this tile show the symbol for the current player
                if state == "" && gameStillGoing {
                    state = player
                    // Advance to next turntr
                    turn += 1
                }
                handleUserAction()
            }
    }

    // MARK: Functions
    
    /// Called by a tap on the view; marks the tile with the current player's symbol and advances to the next turn in the game.
    /// - Tag: user_action
    func handleUserAction() {

        // Make this tile show the symbol for the current player
        state = player
        
        // Advance to next turn
        turn += 1
        
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(state: .constant(empty), gameStillGoing: true,
                 player: nought,
                 turn: .constant(1))
        TileView(state: .constant(nought), gameStillGoing: true,
                 player: nought,
                 turn: .constant(1))
        TileView(state: .constant(cross), gameStillGoing: true,
                 player: nought,
                 turn: .constant(1))
    }
}
