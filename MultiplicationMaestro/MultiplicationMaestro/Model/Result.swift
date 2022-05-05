//
//  Result.swift
//  MultiplicationMaestro
//
//

import Foundation

// Tracks the result of answering a single question
/// - Tag: mm_result_structure
struct Result: Identifiable {
    
    // MARK: Stored properties
    let id = UUID()
    let multiplicand: Int
    let multiplier: Int
    let inputGiven: String
    let answerCorrect: Bool
    
    // MARK: Computed properties
    var correctProduct: Int {
        return multiplicand * multiplier
    }

}

// Test result for use with Xcode Previews
let testResult = Result(multiplicand: 10,
                        multiplier: 10,
                        inputGiven: "101",
                        answerCorrect: false)
