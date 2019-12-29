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
    let diceNumber: Int
    let sizeOfDices: CGFloat = 80.0
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width:sizeOfDices, height: sizeOfDices)
                .shadow(radius: 10)
                .foregroundColor(.white)

            Text("\(diceNumber)")
                .font(.largeTitle)
                .foregroundColor(.red)
        }
    }
}

struct Dice_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(diceNumber: 5)
    }
}
