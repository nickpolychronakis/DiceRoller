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
    // the angle of the rotation of the dices
    @State private var angleOfDice: Double = 0.0
    
    var body: some View {
        VStack {
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
        .rotation3DEffect(.degrees(self.angleOfDice), axis: (x: 1, y: 0, z: 0))
        .animation(Animation.default.speed(0.3))
        .onAppear {
            self.angleOfDice += 720
        }
    }

}



struct Dice_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(diceNumber: 5)
    }
}
