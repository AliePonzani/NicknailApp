//
//  SwiftUIView.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 17/02/25.
//

import SwiftUI

struct GameStartView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        if viewModel.playGame {
            SwiftUIView()
        } else {
            ContentView()
        }
    }
}

#Preview {
    GameStartView()
}
