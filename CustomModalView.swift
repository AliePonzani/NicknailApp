//
//  SwiftUIView 2.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 20/02/25.
//

import SwiftUI
import ConfettiSwiftUI


struct CustomModalView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    @State private var confettiShow = false
    
    var body: some View {
        ZStack{
            VStack{
                Text("🎉 Congratulations on Your New High Score 🎉")
                    .font(.title).padding().fixedSize(horizontal: true, vertical: false)
                
                Text("You did it! You've set a new record and we're incredibly impressed! Your skills are unmatched. Keep playing and continue breaking your own records!")
                    .font(.title2)
                        .multilineTextAlignment(.center) // Alinha o texto ao centro (opcional)
                        .lineLimit(nil) // Permite que o texto quebre em várias linhas
                        .padding() // Adiciona algum espaçamento ao redor do texto
                HStack{
                    Button(action: {
                        viewModel.newHightScore = false
                        viewModel.playGame.toggle()
                        viewModel.score = 0
                    }) {
                        Text("Exit Game")
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        viewModel.newHightScore = false
                        viewModel.score = 0
                    }) {
                        Text("Play Again")
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                }.font(.title).foregroundColor(Color.black)
                
            }
            ConfettiCannon(trigger: $confettiShow, num: 150, colors: [.purple, .yellow, .red, .blue])
        }
        .onAppear {
            confettiShow = true
        }
    }
}

#Preview {
    CustomModalView()
}
