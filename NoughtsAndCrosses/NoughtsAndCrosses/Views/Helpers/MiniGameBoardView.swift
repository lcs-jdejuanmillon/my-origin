//
//  MiniGameBoardView.swift
//  NoughtsAndCrosses
//
//  Created by Russell Gordon on 2022-05-03.
//

import SwiftUI

struct MiniGameBoardView: View {
    
    // MARK: Stored properties
    let result: GameResult
    
    // MARK: Computed properties
    var body: some View {
        // The game board
        VStack(spacing: 2) {
            // Top row
            HStack(spacing: 2) {
                // Send connection to properties on this view
                // to the helper view using a binding
                MiniTileView(state: result.upperLeft)
                MiniTileView(state: result.upperMiddle)
                MiniTileView(state: result.upperRight)
            }

            // Middle row
            HStack(spacing: 2) {
                MiniTileView(state: result.middleLeft)
                MiniTileView(state: result.middleMiddle)
                MiniTileView(state: result.middleRight)
            }

            // Bottom row
            HStack(spacing: 2) {
                MiniTileView(state: result.bottomLeft)
                MiniTileView(state: result.bottomMiddle)
                MiniTileView(state: result.bottomRight)
            }
        }
    }
}

struct MiniGameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        MiniGameBoardView(result: testGameResult)
    }
}
