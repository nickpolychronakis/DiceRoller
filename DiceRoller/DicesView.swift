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
    
    @Binding var numberOfDices: Int
    @Binding var numberOfSides: Int
    
    /// The id for the diceView. It increments after each touch to the screen.
    @Binding var idAfterTouch: Int
    
    @State private var showSheet = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // MARK: Background
                Rectangle()
                    .fill(Color.green)
                
                // MARK: Dice list
                HStack {
                    ForEach(self.arrayOfDices, id: \.self) { diceNum in
                        DiceView(diceNumber: diceNum)
                        // τροποποιώ το frame για να γίνεται το animation απο το κάτω μέρος της οθόνης
                        .frame(height: geo.size.height)
                        .id(self.idAfterTouch) //id changes each time user taps the screen
                        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .scale))
                        .animation(Animation.easeOut.speed(0.2))
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
    }
    
    // MARK: - Add the dices
    // Returns the added number of dices
    func totalRolled() -> Int {
        return self.arrayOfDices.reduce(0) { (result, int) in
            return result + int
        }
    }
}




struct DicesView_Previews: PreviewProvider {
    static var previews: some View {
        DicesView(arrayOfDices: [5,6,7],numberOfDices: .constant(2), numberOfSides: .constant(6), idAfterTouch: .constant(1))
    }
}
