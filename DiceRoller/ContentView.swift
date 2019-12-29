//
//  ContentView.swift
//  DiceRoller
//
//  Created by NICK POLYCHRONAKIS on 29/12/19.
//  Copyright © 2019 NICK POLYCHRONAKIS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    /// The numbers for the dices
    @State private var diceArray = [Int]()
    
    @State private var numberOfDices = 2
    @State private var numberOfSides = 6
        
    var body: some View {
        TabView {
            // MARK: First View
            DicesView(arrayOfDices: diceArray, numberOfDices: self.$numberOfDices, numberOfSides: self.$numberOfSides)
                .tabItem {
                    Image(systemName: "dot.square.fill")
                    Text("Dice")
                }
                .tag(0)
                .onTapGesture(perform: viewIsTapped)

            // MARK: Second View
            Text("View2")
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }
                .tag(1)
        }
    }
    
    
    // MARK: - View tapped
    /// Executed when the view is tapped
    func viewIsTapped() {
        rollDices(numberOfDices: self.numberOfDices, numberOfSides: self.numberOfSides)
    }
    
    
    // MARK: - Roll the dices.
    /// Roll the dices
    func rollDices(numberOfDices: Int, numberOfSides: Int) {
        self.diceArray = []
        for _ in 0..<numberOfDices {
            self.diceArray
                .append(randomDiceNumber(numberOfSides: numberOfSides))
        }
    }
    
    // MARK: - Random Dice Number
    /// Creates a random number for a dice. The dice can have as many sides as we want. PURE FUNCTION
    func randomDiceNumber(numberOfSides: Int) -> Int {
        guard numberOfSides > 1 else { return 1}
        return Array(1...numberOfSides).shuffled().first!
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
