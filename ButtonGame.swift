//
//  SwiftUIView 2.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 19/02/25.
//

import SwiftUI

struct ButtonGame: View {
    @EnvironmentObject var viewModel: GameViewModel
    var imageButton: String
    var answer: Int
    
    var body: some View {
        Button(action:{
            print("\(answer) e \(viewModel.fibonacciNumbers[viewModel.count])")
            if answer == viewModel.fibonacciNumbers[viewModel.count] {
                withAnimation(.easeInOut(duration: 1)) {
                    viewModel.rotateScreen()
                }
                if viewModel.count == 7 {
                    viewModel.count = 0
                } else {
                    viewModel.count += 1
                }
                viewModel.randomizeButtons()
                viewModel.score += 1
            } else {
                if viewModel.score > viewModel.highScore {
                    viewModel.newHightScore = true
                    
                    viewModel.updateHighScore(newHighScore: viewModel.score)
                    viewModel.score = 0
                } else {
                    viewModel.nicknailImage = "nicknailSad"
                    viewModel.gameOver = true
                }
            }
        }){
            ZStack{
                Image(imageButton).resizable()
                    .scaledToFit()
                Text("\(answer)")
                    .font(.system(size: min(1300 * 0.09, max(1300 * 0.09 - CGFloat("\(answer)".count) * 12, 12)), weight: .bold, design: .rounded))
            }
        }
    }
    
}

