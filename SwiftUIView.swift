//
//  SwiftUIView.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 18/02/25.
//

import SwiftUI

struct SwiftUIView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading){
                
                LinearGradient(gradient: Gradient(colors: [Color("skyLigth"), Color("skyColor")]), startPoint: .bottomTrailing, endPoint: .topLeading)
                
                CircleComponent()
           
                Image(viewModel.nicknailImage)
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.degrees(-39))
                    .frame(width: geometry.size.width * 0.44)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                
                HStack{
                    //                Componente dos números
                    VStack(spacing: 20){
                        Text("Qual é o número na sequencia?")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .multilineTextAlignment(.center)
                        ButtonGame(imageButton: "buttonYellow", answer: viewModel.button1)
                        ButtonGame(imageButton: "buttonRed", answer: viewModel.button2)
                        ButtonGame(imageButton: "buttonBlue", answer: viewModel.button3)
                    }.foregroundColor(.black)
                        .padding(.horizontal, 50)
                        .frame(width: geometry.size.width * 0.25)
                    
                    Spacer()
                    
                    HStack{
                        VStack(alignment: .trailing){
                            Text("HIGH SCORE: ")
                            Text("SCORE: ")
                            Spacer()
                        }.padding(.vertical, 50)
                        VStack(alignment: .leading){
                            Text("\(viewModel.highScore)")
                            Text("\(viewModel.score)")
                            Spacer()
                        }.padding(.vertical, 50)
                        
                    }.font(.system(size: geometry.size.width * 0.03, weight: .bold, design: .rounded)).padding(.horizontal, 50)
                }
            }.background(Color("skyColor"))
        }.edgesIgnoringSafeArea(.all)
    }

}

#Preview {
    SwiftUIView()
}
