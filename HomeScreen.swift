//
//  SwiftUIView 3.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 20/02/25.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack{
            Image("GameHome").resizable().scaledToFill().ignoresSafeArea()
            HStack{
                VStack(alignment: .leading){
                    Spacer()
                    Button(action: {
                        viewModel.playGame.toggle()
                    }){
                        ZStack{
                            Image("buttonYellow").resizable().scaledToFit()
                            Text("Play").font(.system(size: 45, weight: .bold, design: .rounded)).foregroundColor(Color.black)
                        }
                    }.frame(maxWidth: 200)
                    HStack{
                        Button(action:{}){
                            ZStack{
                                Image("buttonRed").resizable().scaledToFit()
                                Text("Help").font(.system(size: 40, weight: .bold, design: .rounded)).foregroundColor(Color.black)
                            }
                        }
                        Button(action:{}){
                            ZStack{
                                Image("buttonBlue").resizable().scaledToFit()
                                Text("Settings").font(.system(size: 35, weight: .bold, design: .rounded)).foregroundColor(Color.black)
                            }
                        }
                    }
                } .frame(maxWidth: 400).padding(.vertical, 50)
                Spacer()
                VStack{
                    Text("Record").font(.system(size: 45, weight: .bold, design: .rounded)).foregroundColor(Color.black)
                    Text("\(viewModel.highScore)").font(.system(size: 95, weight: .bold, design: .rounded)).foregroundColor(Color.black)
                    Spacer()
                }
            }.padding(.horizontal, 45).padding(.vertical, 50)
        }
    }
}

#Preview {
    HomeScreen()
}
