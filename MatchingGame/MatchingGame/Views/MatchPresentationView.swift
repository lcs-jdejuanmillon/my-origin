//
//  MatchPresentationView.swift
//  MatchingGame
//
//  Created by Russell Gordon on 2022-05-04.
//

import SwiftUI

struct MatchPresentationView: View {
    
    // MARK: Stored properties
    let items: [ItemToMatch]
    
    // The four items to be shown
    @State var upperLeft: ItemToMatch = testItem
    @State var upperRight: ItemToMatch = testItem
    @State var lowerLeft: ItemToMatch = testItem
    @State var lowerRight: ItemToMatch = testItem
    
    // Is the quiz interface hidden at first?
    @State var quizInterfaceHidden = true
    
    // The correct item
    @State var correctItem: ItemToMatch = testItem
    
    // Has a response been given and an answer checked?
    @State var answerChecked = false
    
    // Was the answer correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    /// - Tag: mg_answer_correct
    var body: some View {
        VStack {
            
            Spacer()
            
            // Options
            HStack(spacing: 5) {
                
                Image(upperLeft.image)
                    .resizable()
                    .scaledToFit()
                    .border(.black, width: 3)
                    .onTapGesture {
                        
                        // Is this the correct image?
                        if upperLeft.description == correctItem.description {
                            answerCorrect = true
                        }
                        
                        // Answer has been checked
                        answerChecked = true
                    }
                
                Image(upperRight.image)
                    .resizable()
                    .scaledToFit()
                    .border(.black, width: 3)
                    .onTapGesture {
                        
                        // Is this the correct image?
                        if upperRight.description == correctItem.description {
                            answerCorrect = true
                        }
                        
                        // Answer has been checked
                        answerChecked = true
                    }
                
            }
            
            HStack(spacing: 5) {
                
                Image(lowerLeft.image)
                    .resizable()
                    .scaledToFit()
                    .border(.black, width: 3)
                    .onTapGesture {
                        
                        // Is this the correct image?
                        if lowerLeft.description == correctItem.description {
                            answerCorrect = true
                        }
                        
                        // Answer has been checked
                        answerChecked = true
                    }
                
                Image(lowerRight.image)
                    .resizable()
                    .scaledToFit()
                    .border(.black, width: 3)
                    .onTapGesture {
                        
                        // Is this the correct image?
                        if lowerRight.description == correctItem.description {
                            answerCorrect = true
                        }
                        
                        // Answer has been checked
                        answerChecked = true
                    }
                
            }
            
            // Prompt
            HStack {
                Text("Which one is the \n**\(correctItem.description)?**")
                    .multilineTextAlignment(.center)
            }
            .padding(.vertical)
            
            // Allow for movement to next question
            Button(action: {
                newQuestion()
            }, label: {
                Text("Next")
                    .font(.title)
            })
            .buttonStyle(.bordered)
            // Only show this button when an answer has been checked
            .opacity(answerChecked == true ? 1.0 : 0.0)
            .padding([.leading, .trailing, .bottom])

            // Result
            ZStack {
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.green)
                // Only show this when the answer given is correct
                //            CONDITION          true  false
                    .opacity(answerCorrect == true ? 1.0 : 0.0)
                
                Image(systemName: "x.square")
                    .resizable()
                    .scaledToFit()
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
            .padding(.horizontal, 75)
            
        }
        .padding(.horizontal)
        // Hide quiz interface at first
        .opacity(quizInterfaceHidden == true ? 0.0 : 1.0)
        // Runs as soon as this view is loaded
        .task {
            
            // Generate a new question
            newQuestion()
            
            // Show quiz interface
            quizInterfaceHidden = false
            
        }
    }
    
    // MARK: Functions
    func newQuestion() {
        
        // Reset flags for determining answer state
        answerChecked = false
        answerCorrect = false
        
        // Randomly select four items to display
        upperLeft = items.randomElement()!
        upperRight = items.randomElement()!
        lowerLeft = items.randomElement()!
        lowerRight = items.randomElement()!
        
        // Now make one of these items the correct item
        let someRandomValue = Int.random(in: 1...4)
        switch someRandomValue {
        case 1:
            correctItem = upperLeft
        case 2:
            correctItem = upperRight
        case 3:
            correctItem = lowerLeft
        case 4:
            correctItem = lowerRight
        default:
            break
        }
        
    }
}

struct MatchPresentationView_Previews: PreviewProvider {
    static var previews: some View {
        MatchPresentationView(items: testItems)
    }
}
