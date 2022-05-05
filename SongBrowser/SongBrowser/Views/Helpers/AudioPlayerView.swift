//
//  AudioPlayerView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import AVKit
import SwiftUI

// ADAPTED FROM SOURCE: https://medium.com/swift-productions/swiftui-play-an-audio-with-avaudioplayer-1c4085e2052c
//
// NOTE: It is also possible to play audio from files in the app bundle.

struct AudioPlayerView: View {
    
    // MARK: Stored properties
    
    // Used to play the audio
    @State var audioPlayer: AVPlayer = AVPlayer()
    
    // What remote link
    let urlOfSongToPlay: String
    
    // Whether a song is playing
    @State var isSongPlaying = false
    
    // MARK: Stored properties
    var body: some View {
        
        ZStack {
            
            Button(action: {
                audioPlayer.play()
                isSongPlaying = true
            }) {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
            }
            // Visible only when song is not playing
            .opacity(isSongPlaying == false ? 1.0 : 0.0)
            
            Button(action: {
                audioPlayer.pause()
                isSongPlaying = false
            }) {
                Image(systemName: "pause.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
            }
            // Visible only when song IS playing
            .opacity(isSongPlaying == true ? 1.0 : 0.0)
        }
        .onAppear {
            
            // Create a URL instance from the preview URL
            let url = URL(string: urlOfSongToPlay)!
            
            // Make an instance of AVPlayerItem
            let playerItem = AVPlayerItem(url: url)
            
            // Reset instance of AVPlayer
            audioPlayer = AVPlayer(playerItem: playerItem)
            
            // Set the volume
            audioPlayer.volume = 0.5
            
        }
        .onDisappear() {
            isSongPlaying = false
            audioPlayer.pause()
        }
    }
    
}

struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView(urlOfSongToPlay: testSong.previewUrl)
    }
}
