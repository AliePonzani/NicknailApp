//
//  SwiftUIView.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 17/02/25.
//

import SwiftUI

struct GameStartView: View {
    @State private var playGame:Bool = false
    @State private var rotationCicle: Double = 0
    @State private var results: [String] = ["0","1","1","2","3","5","8","13","21"]
    var body: some View {
        if playGame {
            SwiftUIView()
        } else {
            ContentView(playGame: $playGame)
        }
    }
}

#Preview {
    GameStartView()
}
