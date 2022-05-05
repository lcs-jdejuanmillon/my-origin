//
//  GameView.swift
//  MatchingGame
//
//  Created by Russell Gordon on 2022-05-04.
//

import SwiftUI

struct GameView: View {
    
    // MARK: Stored properties
    
    // Stores the entire list of items we could make matches from
    @State var possibleItems: [ItemToMatch] = []
    
    // Stores an image to show
    @State var currentItem: ItemToMatch = testItem
    
    // Is a game on?
    @State var gameOn: Bool = false
    
    // How many rounds have been played?
    @State var roundsPlayed = 0
    
    // How many correct matches were made?
    @State var correctMatches = 0
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            if gameOn {
                MatchPresentationView(items: possibleItems)
            } else {
                Button(action: {
                    gameOn.toggle()
                }, label: {
                    Text("Let's play!")
                        .font(.title)
                })
                .buttonStyle(.bordered)
            }
        }
        // This runs as soon as the app opens
        .task {
            loadItemData()
        }
        
    }

    // MARK: Functions
    
    /// Loads data about items to be matched from a JSON file in the app bundle.
    /// - Tag: mg_input_from_file
    func loadItemData() {
        
        // Get list of items that could be matched from the app bundle
        let url = Bundle.main.url(forResource: "items-to-match-with", withExtension: "json")!
        
        // Load the contents of the JSON file
        let data = try! Data(contentsOf: url)
        
        // DEBUG: What data was pulled from that file?
        print("Data loaded from JSON file in app bundle had this data...")
        print("===")
        print(String(data: data, encoding: .utf8)!)
        
        // Convert each JSON object into instances of the structure in the list
        possibleItems = try! JSONDecoder().decode([ItemToMatch].self, from: data)
        
        // DEBUG: How many items are there in the list now?
        print(dump(possibleItems))
        
        // Pick a random item to show, or if that doesn't work, show the test item
        currentItem = possibleItems.randomElement() ?? testItem

    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
