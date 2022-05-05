//
//  FavouritesView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-21.
//

import SwiftUI

struct FavouritesView: View {
    
    // MARK: Stored properties
    
    // Derived value; a reference to the list of favourite songs
    @Binding var favourites: [Song]
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            VStack {
                // Show message if no favourites noted
                if favourites.isEmpty {

                    Spacer()
                    
                    Text("No favourite songs yet")
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Spacer()

                } else {

                    // Show list of favourite songs
                    List(favourites, id: \.trackId) { currentSong in
                        
                        NavigationLink(destination: SongDetailView(song: currentSong, inFavourites: true, favourites: $favourites)) {
                            ListItemView(song: currentSong)
                        }
                        
                    }
                    
                }
            }
            .navigationTitle("Favourites")
            
        }
        
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(favourites: .constant([testSong]))
    }
}
