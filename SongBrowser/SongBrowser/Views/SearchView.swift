//
//  SearchView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: Stored properties
    
    // Keeps track of what the user searches for
    @State var searchText: String = ""
    
    // Keeps the list of songs retrieved from Apple Music
    @State var foundSongs: [Song] = [] // empty array to start
    
    // Derived value; a reference to the list of favourite songs
    // The source of truth (original instance) is at the app level
    @Binding var favourites: [Song]
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationView {
            
            ZStack {

                VStack {
                    
                    // Search text was given, results obtained
                    // Show the list of results
                    // Keypath of \.trackId tells the List view what property to use
                    // to uniquely identify each song
                    List(foundSongs, id: \.trackId) { currentSong in
                        
                        NavigationLink(destination: SongDetailView(song: currentSong, inFavourites: false, favourites: $favourites)) {
                            ListItemView(song: currentSong)
                        }
                        
                    }
                    .searchable(text: $searchText)
                    .onChange(of: searchText) { whatWasTyped in
                        
                        // When what is typed in the search field changes,
                        // get new results from the endpoint
                        Task {
                            await fetchResults()
                        }

                    }

                    
                }
                .navigationTitle("Song Browser")

                // Show a prompt when there are no results yet
                VStack {
                    Spacer()
                    
                    Text("Enter a song or artist name")
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                .opacity(searchText.isEmpty ? 1.0 : 0.0)
                
            }
            
            
        }
        
    }
    
    // MARK: Functions
    func fetchResults() async {
        
        // Sanitize the search input
        // Converts something like "TaYLoR SWiFt" to "taylor+swift"
        let input = searchText.lowercased().replacingOccurrences(of: " ", with: "+")
        
        // Set the address of the JSON endpoint
        // For more deatils, see:
        // https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/
        let url = URL(string: "https://itunes.apple.com/search?term=\(input)&entity=song")!
        
        // Configure a URLRequest instance
        // Defines what type of request will be sent to the address noted above
        var request = URLRequest(url: url)
        request.setValue("application/json",
                         forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        // Start a URL session to interact with the endpoint
        let urlSession = URLSession.shared
        
        // Fetch the results of this search
        do {
            // Get the raw data from the endpoint
            let (data, _) = try await urlSession.data(for: request)
            
            // DEBUG: See what raw JSON data was returned from the server
            print(String(data: data, encoding: .utf8)!)
            
            // Attempt to decode and return the object containing
            // the search result
            // NOTE: We decode to SearchResult.self since the endpoint
            //       returns a single JSON object
            let decodedSearchResult = try JSONDecoder().decode(SearchResult.self, from: data)
            
            // Now, we access the list of songs that are part of the decoded result
            // This is assigned to the array that will display the songs in the user interface
            foundSongs = decodedSearchResult.results
            
        } catch {
            
            // Report about what happened
            print("Could not retrieve / decode JSON from endpoint.")
            print(error)
            
        }
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(favourites: .constant([testSong]))
    }
}
