//
//  SongDetailView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

struct SongDetailView: View {
    
    // MARK: Stored properties
    
    // Song to show in this view
    var song: Song
    
    // Whether this song is in the Favourites list or not
    @State var inFavourites: Bool
    
    // A reference to the list of favourite songs
    // This is a derived value; source of truth is at the app level
    @Binding var favourites: [Song]
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                RemoteImageView(fromURL: URL(string: song.artworkUrl100)!)
                
                VStack(alignment: .leading) {
                    
                    Text(song.trackName)
                        .font(.title)
                    
                    Text(song.artistName)
                        .font(.subheadline)
                    
                }
                
            }
            
            HStack {
                
                AudioPlayerView(urlOfSongToPlay: song.previewUrl)

                Spacer()

                FavouritesButtonView(song: song,
                                     inFavourites: $inFavourites,
                                     favourites: $favourites)
            }
            .padding(.top, 20)
            .padding(.horizontal, 5)
            
            Text("Store Links")
                .font(.title2)
                .bold()
                .padding(.top, 20)
            
            Link("View artist", destination: URL(string: song.artistViewUrl)!)
                .padding(.top, 5)
            
            Link("View album", destination: URL(string: song.collectionViewUrl)!)
                .padding(.top, 5)

            
            Spacer()
                .frame(maxWidth: .infinity)
            
        }
        .padding()
        // Make the nav bar be "small" at top of view
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SongDetailView(song: testSong,
                     inFavourites: false,
                     favourites: .constant([]))
        }
    }
}
