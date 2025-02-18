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
        if !playGame {
            GeometryReader { geometry in
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [.white, Color(.sky)]), startPoint: .bottomTrailing, endPoint: .topLeading)
                    
                    
                    ZStack{
                        Image("circlePlay")
                            .resizable()
                            .scaledToFill() // Ajusta a imagem para se ajustar ao tamanho sem distorcer
                            .frame(width: geometry.size.width * 2.2)
                            
                        
                        ZStack{
                            
                            VStack{
                                Spacer()
                                HStack{
                                    Text("8").font(.system(size: 150, weight: .bold, design: .rounded)).foregroundColor(Color.black)
                                    Spacer()
                                }.frame(width: geometry.size.width * 0.95).border(.black)
                                
                            }.frame(height: 650)
                            
                            VStack{
                                HStack{
                                    Text("0").font(.system(size: 150, weight: .bold, design: .rounded)).foregroundColor(Color.black)
                                    Spacer()
                                }.frame(width: geometry.size.width * 0.95).border(.black)
                                Spacer()
                            }.frame(height: geometry.size.width * 0.56)
                            
                            
                            
                            VStack{
                                HStack{
                                    Text("1").font(.system(size: 150, weight: .bold, design: .rounded)).foregroundColor(Color.black)
                                    Spacer()
                                }.frame(width: geometry.size.width * 0.45)
                                Spacer()
                            }.frame(height: geometry.size.width * 1.03)
                            
                            
                            VStack{
                                HStack{
                                    Spacer()
                                    Text("2").font(.system(size: 150, weight: .bold, design: .rounded)).foregroundColor(Color.black)
                                        .rotationEffect(.degrees(28))
                                }.frame(width: geometry.size.width * 0.5)
                                Spacer()
                            }.frame(height: geometry.size.width * 1.03)
                            
                            VStack{
                                HStack{
                                    Spacer()
                                    Text("3").font(.system(size: 150, weight: .bold, design: .rounded)).foregroundColor(Color.black)
                                        .rotationEffect(.degrees(70))
                                }.frame(width: geometry.size.width * 1)
                                Spacer()
                            }.frame(height: geometry.size.width * 0.5)
                            
                            VStack{
                                HStack{
                                    Spacer()
                                    Text("4").font(.system(size: 150, weight: .bold, design: .rounded)).foregroundColor(Color.black)
                                        .rotationEffect(.degrees(100))
                                }.frame(width: geometry.size.width * 1.1, height: geometry.size.width * 2)
                                Spacer()
                            }.frame(height: -geometry.size.width * (0.1))
                            
                            
                        }
                    }.rotationEffect(.degrees(rotationCicle), anchor: .center)
                        .position(x: geometry.size.width - (geometry.size.width * 0.1), // Coloca no canto inferior direito
                                  y: geometry.size.width - (geometry.size.height * 0.25)) // Move para o fundo da tela
                    
                    Image("nicknail")
                        .resizable()
                        .scaledToFit() // Ajusta a imagem para se ajustar ao tamanho sem distorcer
                        .frame(width: geometry.size.width * 0.4) // Ajusta o tamanho da imagem
                        .position(x: geometry.size.width - (geometry.size.width * 0.5), // Coloca no canto inferior direito
                                  y: geometry.size.height * 1.5 - (geometry.size.height * 1.03)) // Move para o fundo da tela
                        .rotationEffect(.degrees(-32))
                    
                    HStack{
                        VStack(spacing: 40){
                            Button(action:{
                                withAnimation(.easeInOut(duration: 1)) {
                                    rotationCicle -= 45 // Aumenta o ângulo em 45 graus a cada clique
                                }
                            }){
                                Image("buttonYellow").resizable().scaledToFit()
                            }
                            Button(action:{}){
                                Image("buttonRed").resizable().scaledToFit()
                            }
                            Button(action:{}){
                                Image("buttonBlue").resizable().scaledToFit()
                            }
                        }.frame(width: geometry.size.width * 0.15)
                        Spacer()
                    }.padding(50)
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
