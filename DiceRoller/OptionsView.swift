//
//  OptionsView.swift
//  DiceRoller
//
//  Created by NICK POLYCHRONAKIS on 29/12/19.
//  Copyright © 2019 NICK POLYCHRONAKIS. All rights reserved.
//

import SwiftUI

struct OptionsView: View {
    @Binding var numberOfDices: Int
    @Binding var numberOfSides: Int
    
    let optionsForSides = [4,6,8,10,12,20,100]
    @State private var selectedNumberOfSides = 1
    
    let optionsForDices = [1,2,3]
    @State private var selectedNumberOfDices = 1
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.orange)
                .edgesIgnoringSafeArea(.all)

            VStack {
                // MARK: Top label
                Text("Options")
                    .labelFormatter()

                
                // Number of sides
                Picker(selection: $selectedNumberOfSides, label: Text("Sides").fontWeight(.bold)) {
                    ForEach(0..<optionsForSides.count) { index in
                        Text("\(self.optionsForSides[index])")
                        .fontWeight(.bold)
                    }
                }
                
                // Number of dices
                Picker.init(selection: $selectedNumberOfDices, label: Text("Dices").fontWeight(.bold)) {
                    ForEach(0..<optionsForDices.count) { index in
                        Text("\(self.optionsForDices[index])")
                        .fontWeight(.bold)
                    }
                }
                
                Spacer()
 
            }
            .padding()
            .onAppear {
                self.selectedNumberOfDices = self.optionsForDices.firstIndex(of: self.numberOfDices) ?? 1
                            self.selectedNumberOfSides = self.optionsForSides.firstIndex(of: self.numberOfSides) ?? 1
            }
            .onDisappear {
                self.numberOfSides = self.optionsForSides[self.selectedNumberOfSides]
                self.numberOfDices = self.optionsForDices[self.selectedNumberOfDices]
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(numberOfDices: .constant(2), numberOfSides: .constant(6))
    }
}
