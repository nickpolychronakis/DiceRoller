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
    @State private var diceArray: [Int] = [Int]()
    
    // Number of dices and how many sides they will have
    @Binding var numberOfDices: Int
    @Binding var numberOfSides: Int
    
    /// It changes id of dicesView incrementaly after each touch
    @State private var idAfterTouch = 0
    
    /// Show sheet
    @State private var showSheet = false
    
    /// the angle of rotation of the dice
    @State private var angleOfDice: Double = 0.0
    
    /// The history array
    @Binding var historyArray: [[Int]]
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // MARK: Background
                Rectangle()
                    .fill(Color.green)
                
                // MARK: Dice list
                HStack {
                    ForEach(self.diceArray, id: \.self) { diceNum in
                        DiceView(diceNumber: diceNum)
                        // τροποποιώ το frame για να γίνεται το animation απο το κάτω μέρος της οθόνης
                        .frame(height: geo.size.height)
                        .id(self.idAfterTouch) //id changes each time user taps the screen
                        .rotation3DEffect(.degrees(self.angleOfDice), axis: (x: 1, y: 0, z: 0))
                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .scale))
                        .animation(Animation.easeOut.speed(0.3))
                        .padding()
                    }
                }
                
                // MARK: Top label
                VStack {
                    Text("Tap to roll dices")
                        .labelFormatter()
                    Spacer()
                }
                
                // MARK: Options button
                VStack {
                    HStack {
                        Button.init(action: {
                            self.showSheet = true
                        }) {
                            Image(systemName: "gear")
                            .labelFormatter()
                            .padding(.leading, 10)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .sheet(isPresented: self.$showSheet) {
                    // MARK: Sheet View
                    OptionsView(numberOfDices: self.$numberOfDices, numberOfSides: self.$numberOfSides)
                }
                
                // MARK:  Bottom Label
                if self.totalRolled() > 0 {
                    VStack {
                        Spacer()
                        Text("Total: \(self.totalRolled())")
                            .labelFormatter()
                            .padding(.bottom, 20)
                    }
                }
            }
        }
        .onTapGesture(perform: viewIsTapped)
    }
    
    // MARK: - FUNCTIONS
    
    // MARK: - Add the dices
    // Returns the added number of dices
    func totalRolled() -> Int {
        return self.diceArray.reduce(0) { (result, int) in
            return result + int
        }
    }
    
    // MARK: - View tapped
    /// Executed when the view is tapped
    func viewIsTapped() {
        self.idAfterTouch += 1
        rollDices(numberOfDices: self.numberOfDices, numberOfSides: self.numberOfSides)
        withAnimation(Animation.easeOut.speed(0.3)) {
            self.angleOfDice += 1080
        }
        self.historyArray.insert(self.diceArray, at: 0)
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



// MARK: - PREVIEW
struct DicesView_Previews: PreviewProvider {
    static var previews: some View {
        DicesView(numberOfDices: .constant(2), numberOfSides: .constant(6), historyArray: .constant([[1,2,3],[4,5,6]]))
    }
}
