//
//  DiceView.swift
//  DiceRoller
//
//  Created by NICK POLYCHRONAKIS on 29/12/19.
//  Copyright © 2019 NICK POLYCHRONAKIS. All rights reserved.
//

import SwiftUI

/// A View that draws a dice with a specific number
struct DiceView: View {
    // Number of the dice
    let diceNumber: Int
    // The size of the dice
    let sizeOfDices: CGFloat = 80.0
    
    var body: some View {
        VStack {
            ZStack {
                // MARK: Background
                RoundedRectangle(cornerRadius: 20)
                    .frame(width:sizeOfDices, height: sizeOfDices)
                    .shadow(radius: 10)
                    .foregroundColor(.white)
                    .animation(.none)

                // MARK: Dice number
                Text("\(diceNumber)")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .animation(.none)
            }
        }
    }

}



struct Dice_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(diceNumber: 5)
    }
}
