//
//  SwiftUIView.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 17/02/25.
//

import SwiftUI

struct GameStartView: View {
    @State private var playGame:Bool = false
    var body: some View {
        if !playGame {
            GeometryReader { geometry in
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .bottomTrailing, endPoint: .topLeading)
                    
                    Image("circlePlay")
                        .resizable()
                        .scaledToFill() // Ajusta a imagem para se ajustar ao tamanho sem distorcer
                        .frame(width: geometry.size.width * 2.3) // Ajusta o tamanho da imagem
                        .position(x: geometry.size.width - (geometry.size.width * 0.2), // Coloca no canto inferior direito
                                  y: geometry.size.width - (geometry.size.height * 0.25)) // Move para o fundo da tela
                    
                    HStack{
                        VStack(spacing: 40){
                            Button(action:{}){
                                Image("buttonYellow").resizable().scaledToFit()
                            }
                            Button(action:{}){
                                Image("buttonRed").resizable().scaledToFit()
                            }
                            Button(action:{}){
                                Image("buttonBlue").resizable().scaledToFit()
                            }
                        }.frame(width: geometry.size.width * 0.15).border(.black)
                        Spacer()
                    }
                }
            }.edgesIgnoringSafeArea(.all)
        } else {
            ContentView(playGame: $playGame)
        }
    }
}

#Preview {
    GameStartView()
}
