//
//  ContentView.swift
//  DiceRoller
//
//  Created by NICK POLYCHRONAKIS on 29/12/19.
//  Copyright © 2019 NICK POLYCHRONAKIS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    /// The history array
    @State private var historyArray = [[Int]]()
    
    @State private var numberOfDices = 2
    @State private var numberOfSides = 6
        
    var body: some View {
        TabView {
            // MARK: First View
            DicesView(numberOfDices: self.$numberOfDices, numberOfSides: self.$numberOfSides, historyArray: $historyArray)
                .tabItem {
                    Image(systemName: "dot.square.fill")
                        .imageScale(.large)
                    Text("Dices")
                }
                .tag(0)

            // MARK: Second View
            HistoryView(historyArray: $historyArray)
                .tabItem {
                    Image(systemName: "clock.fill")
                        .imageScale(.large)
                    Text("History")
                }
                .tag(1)
        }
    }
    
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
