//
//  QuestionPresentationView.swift
//  MultiplicationMaestro
//
//

import SwiftUI

/// - Tag: mm_question_presentation
struct QuestionPresentationView: View {
    
    // MARK: Stored properties
    let multiplicand: Int
    let multiplier: Int
    
    // MARK: Computed properties
    var body: some View {
        
        // Operation, values to be multiplied
        HStack {
            Text("×")
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(multiplicand)")
                Text("\(multiplier)")
            }
        }

    }
}

struct QuestionPresentationView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPresentationView(multiplicand: 7,
                                 multiplier: 8)
    }
}
