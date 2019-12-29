//
//  DicesView.swift
//  DiceRoller
//
//  Created by NICK POLYCHRONAKIS on 29/12/19.
//  Copyright © 2019 NICK POLYCHRONAKIS. All rights reserved.
//

import SwiftUI

/// A View that draws as many Dices as you want, with a green background
struct DicesView: View {
    // the array with the numbers the dices will appear
    let arrayOfDices: [Int]
    
    var body: some View {
        ZStack {
            
            // MARK: Background
            Rectangle()
                .fill(Color.green)
            
            // MARK: Dice list
            HStack {
                ForEach(arrayOfDices, id: \.self) { diceNum in
                    DiceView(diceNumber: diceNum)
                    .id(UUID())
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .scale))
                    .animation(Animation.easeInOut.speed(0.2))
                }
            }
            
            // MARK: Top label
            VStack {
                Text("Tap to roll dices")
                    .font(.largeTitle)
                    .padding(8)
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.top, 20)
                Spacer()
            }
        }
    }
}

struct DicesView_Previews: PreviewProvider {
    static var previews: some View {
        DicesView(arrayOfDices: [5,6,7,8])
    }
}
