//
//  HistoryView.swift
//  DiceRoller
//
//  Created by NICK POLYCHRONAKIS on 29/12/19.
//  Copyright © 2019 NICK POLYCHRONAKIS. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @Binding var historyArray: [[Int]]
    
    var body: some View {
        VStack {
            Text("History")
                .labelFormatter()
            List(historyArray, id: \.self) { array in
                Text(ListFormatter.localizedString(byJoining: array.map(String.init)))
                    .font(.title)
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(historyArray: .constant([[1,2,3],[4,5,6]]))
    }
}
