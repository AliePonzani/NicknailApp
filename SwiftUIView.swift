//
//  SwiftUIView.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 18/02/25.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var rotationCicle: Double = 0
    @State private var numbers = [0, 1, 1, 2, 3, 5, 8, 13]
    @State private var count: Int = 8
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading){
                
                CircleComponent(numbers: $numbers, rotationCicle: $rotationCicle)
                
                
                Image("nicknail")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.degrees(-23))
                    .frame(width: geometry.size.width * 0.43)
                    .position(x: geometry.size.width * 0.6, y: geometry.size.height * 0.39)
                
                
//                Componente dos números
                VStack(spacing: 20){
                    Text("Qual é o número na sequencia?")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                    ZStack{
                        Button(action:{
                            withAnimation(.easeInOut(duration: 1)) {
                                rotationCicle -= 45
                                count = count-1
                                print("contador esta em \(count)")
                                if count < 6{
                                    print("vai somar a posicao \(count+1) com a posicao \(count+2)")
                                    
                                } else if count == 0{
                                    count = 8
                                }
                                
                                
                            }
                        }){
                            Image("buttonYellow").resizable()
                                .scaledToFit()
                        }
                        Text("1")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                    }
                    ZStack{
                        Button(action:{}){
                            Image("buttonRed").resizable()
                                .scaledToFit()
                        }
                        Text("2")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                    }
                    ZStack{
                        Button(action:{}){
                            Image("buttonBlue").resizable()
                                .scaledToFit()
                        }
                        Text("3")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                    }
                    
                    
                }
                .padding(.horizontal, 40)
                .frame(width: geometry.size.width * 0.2)
                
            }.background(Color(.sky))
        }.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SwiftUIView()
}
