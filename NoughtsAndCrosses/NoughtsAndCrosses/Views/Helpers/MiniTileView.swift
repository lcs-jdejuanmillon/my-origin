//
//  MiniTileView.swift
//  NoughtsAndCrosses
//
//  Created by Russell Gordon on 2022-05-03.
//

import SwiftUI

struct MiniTileView: View {
    
    // MARK: Stored properties
    
    // What is in this tile?
    let state: String
        
    // MARK: Computed property
    var body: some View {
        Text(state)
            .font(.caption2)
            .frame(width: 18, height: 18)
            .border(Color.black, width: 2)
    }
    
}

struct MiniTileView_Previews: PreviewProvider {
    static var previews: some View {
        MiniTileView(state: cross)
    }
}
