//
//  CheckAnswerButtonView.swift
//  MultiplicationMaestro
//
//

import SwiftUI

/// - Tag: mm_check_answer_button
struct CheckAnswerButtonView: View {
    
    // MARK: Stored properties
    let multiplicand: Int
    let multiplier: Int
    let inputGiven: String
    @Binding var answerChecked: Bool
    @Binding var answerCorrect: Bool
    @Binding var results: [Result]

    // MARK: Computed properties
    // Gets updated as new values are randomly generated
    var correctProduct: Int {
        return multiplicand * multiplier
    }

    // The button that allows an answer to be checked
    /// - Tag: mm_answer_correct
    var body: some View {
        Button(action: {
            
            // If we've gotten to this point, the answer has at least been checked
            answerChecked = true
            
            // Convert the provided input (String) into integer (Int) if possible
            guard let answerGiven = Int(inputGiven) else {
                // User gave invalid input (e.g.: typed 'mangos' rather than 5)
                answerCorrect = false
                // Save this result
                saveResult()
                // Stop checking the answer
                return
            }
            
            // Is the integer given actually correct?
            if answerGiven == correctProduct {
                answerCorrect = true
            } else {
                answerCorrect = false
            }

            // Save this result
            saveResult()

        }, label: {
            Text("Check Answer")
                .font(.largeTitle)
        })
            // Only show this button when an answer has not been checked
            .opacity(answerChecked == false ? 1.0 : 0.0)
            .padding()
            .buttonStyle(.bordered)
    }
    
    // MARK: Functions
    
    // Save the result of a question that has been answered
    /// - Tag: mm_adding_to_list
    func saveResult() {
        
        // Create a result to save based on current question state
        let newResult = Result(multiplicand: multiplicand,
                               multiplier: multiplier,
                               inputGiven: inputGiven,
                               answerCorrect: answerCorrect)
        
        // Insert most recent result in the first position in list
        // This ensures newer results at top of list; older at bottom
        results.insert(newResult, at: 0)
        
    }

    
}

struct CheckAnswerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CheckAnswerButtonView(multiplicand: 7,
                              multiplier: 7,
                              inputGiven: "56",
                              answerChecked: .constant(false),
                              answerCorrect: .constant(true),
                              results: .constant([]))
    }
}
