//
//  AnswerAndResultView.swift
//  MultiplicationMaestro
//
//

import SwiftUI

/// - Tag: mm_answer_and_result
struct AnswerAndResultView: View {
    
    // MARK: Stored properties
    let answerChecked: Bool
    let answerCorrect: Bool
    @Binding var inputGiven: String
    
    // MARK: Computed properties
    /// - Tag: mm_user_action
    var body: some View {
        HStack {

            ZStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                    // Only show this when the answer given is correct
                    //            CONDITION          true  false
                    .opacity(answerCorrect == true ? 1.0 : 0.0)

                Image(systemName: "x.square")
                    .foregroundColor(.red)
                    // Show this when both of the following situations are true:
                    // 1. Answer has been checked.
                    // 2. Answer was not correct.
                    // Necessary since if we show this only when an answer is incorrect,
                    // with no other conditions, it would show as soon as a new
                    // question is generated.
                    //                 CONDITION1  AND  CONDITION2             true  false
                    .opacity(answerChecked == true && answerCorrect == false ? 1.0 : 0.0)
            }

            Spacer()
            
            TextField("", text: $inputGiven)
                // Ensure input is right-aligned
                .multilineTextAlignment(.trailing)
        }
    }
}

struct AnswerAndResultView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerAndResultView(answerChecked: false,
                            answerCorrect: false,
                            inputGiven: .constant("77"))
    }
}
