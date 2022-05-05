//
//  PriorResultView.swift
//  MultiplicationMaestro
//
//

import SwiftUI

// This view is an abstraction; keeps code in main view less busy
// Purpose is to display a single result from a prior question.
struct PriorResultView: View {
    
    // MARK: Stored properties
    let result: Result
    
    // MARK: Computed properties
    var body: some View {
        HStack {
            Text("\(result.multiplicand)")
            Text("×")
            Text("\(result.multiplier)")
            Text("=")
            Text("\(result.inputGiven)")
            Text("(\(result.correctProduct))")
                .opacity(result.answerCorrect == false ? 1.0 : 0.0)
            Spacer()
            ZStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                    .opacity(result.answerCorrect == true ? 1.0 : 0.0)

                Image(systemName: "x.square")
                    .foregroundColor(.red)
                    .opacity(result.answerCorrect == false ? 1.0 : 0.0)
            }
        }
        .font(.title2)
    }
}

struct PriorResultView_Previews: PreviewProvider {
    static var previews: some View {
        
        // List and padding added so that preview has same
        // dimensions and "fit" as on the main view (ContentView)
        List {
            PriorResultView(result: testResult)
        }
        .padding(.horizontal)
        
    }
}
