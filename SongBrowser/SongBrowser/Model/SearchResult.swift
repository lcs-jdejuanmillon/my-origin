//
//  SearchResult.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-20.
//

import Foundation

// This matches the top-level structure of the response when using this endpoint:
//
// https://itunes.apple.com/search?term=taylor+swift&entity=song
//
// For full details, see:
//
// https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/
//
struct SearchResult: Decodable {
    
    let results: [Song]
    
}
