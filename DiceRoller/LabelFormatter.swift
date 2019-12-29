//
//  LabelFormatter.swift
//  DiceRoller
//
//  Created by NICK POLYCHRONAKIS on 29/12/19.
//  Copyright © 2019 NICK POLYCHRONAKIS. All rights reserved.
//

import SwiftUI

extension View {
    func labelFormatter() -> some View {
        return self
            .font(.largeTitle)
            .padding(12)
            .frame(height: 60)
            .background(Color.black.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(25)
            .padding(.top, 20)
    }
}

