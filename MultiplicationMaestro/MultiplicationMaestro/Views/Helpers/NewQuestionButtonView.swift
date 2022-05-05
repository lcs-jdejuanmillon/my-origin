//
//  NewQuestionButtonView.swift
//  MultiplicationMaestro
//
//

import SwiftUI

/// - Tag: mm_new_question
struct NewQuestionButtonView: View {
    
    // MARK: Stored properties
    @Binding var multiplicand: Int
    @Binding var multiplier: Int
    @Binding var answerChecked: Bool
    @Binding var answerCorrect: Bool
    @Binding var inputGiven: String
    
    // MARK: Computed properties
    var body: some View {
        Button(action: {
            
            // Generate a new question
            multiplicand = Int.random(in: 1...12)
            multiplier = Int.random(in: 1...12)
            
            // Reset properties that track what's happening with the current question
            answerChecked = false
            answerCorrect = false
            
            // Reset the input field
            inputGiven = ""
            
        }, label: {
            Text("New question")
                .font(.largeTitle)
        })
            .padding()
            .buttonStyle(.bordered)
            // Only show this button when an answer has been checked
            .opacity(answerChecked == true ? 1.0 : 0.0)
    }
}

struct NewQuestionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NewQuestionButtonView(multiplicand: .constant(7),
                              multiplier: .constant(8),
                              answerChecked: .constant(false),
                              answerCorrect: .constant(true),
                              inputGiven: .constant("56"))
    }
}
