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
        List(historyArray, id: \.self) { array in
            Text(self.reduceArray(array))
                .font(.title)
        }
        .onAppear {
            UITableView.appearance().backgroundColor = UIColor.lightGray
            UITableViewCell.appearance().backgroundColor = UIColor.lightGray
        }
    }
    
    func reduceArray(_ array: [Int]) -> String {
        array.reduce("") { (result, int) -> String in
            return result + (result == "" ? "" : ", ") + "\(int)"
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(historyArray: .constant([[1,2,3],[4,5,6]]))
    }
}
