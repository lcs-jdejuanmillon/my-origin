//
//  GameResultView.swift
//  NoughtsAndCrosses
//
//  Created by Russell Gordon on 2022-05-03.
//

import SwiftUI

struct GameResultView: View {

    // MARK: Stored properties
    let result: GameResult
    
    // MARK: Computed properties
    var body: some View {

        HStack {
            
            // Pass the result along to this view...
            MiniGameBoardView(result: result)
            
            VStack {
                
                HStack {
                    Text(result.outcome == draw ? "Draw" : "\(result.outcome) won after \(result.turnsTotal) turns.")
                        .bold()

                    Spacer()
                }
                
            }
            .padding(.leading)

        }

    }
}

struct GameResultView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Show the preview within a list, since this is how it will be used
        // in GameBoardView
        List {
            GameResultView(result: testGameResult)
        }
        
    }
}
