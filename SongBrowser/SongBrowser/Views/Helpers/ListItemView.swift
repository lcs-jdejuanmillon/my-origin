//
//  ListItem.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

struct ListItemView: View {
    
    // MARK: Stored properties
    var song: Song
    
    // MARK: Computed properties
    var body: some View {

        VStack(alignment: .leading) {
            
            Text(song.trackName)
            
            Text(song.artistName)
                .font(.caption)
            
        }

    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(song: testSong)
    }
}
