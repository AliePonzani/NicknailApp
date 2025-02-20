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
        ZStack{
            if viewModel.playGame {
                FibonacciGame().onAppear{
                    viewModel.getScreenDimensions()
                }
            } else if viewModel.highScore == 0 {
                IntroductionScreen().onAppear{
                    viewModel.getScreenDimensions()
                }
            } else {
                HomeScreen().onAppear{
                    viewModel.getScreenDimensions()
                }
            }
        }.sheet(isPresented: $viewModel.orientationIsVertical) {
            VStack{
                Text("This app is designed to be played in landscape mode 🔄. Please rotate your device before starting the game. Enjoy!")
            }
        }
    }
}

#Preview {
    GameStartView()
}
