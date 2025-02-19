//
//  SwiftUIView 2.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 18/02/25.
//

import SwiftUI

struct CircleComponent: View {
    @Binding var numbers: [Int]
    @Binding var rotationCicle: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("circlePlay")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 2.5, height: geometry.size.height * 3)
                    .clipped()
                
    //                inserir os numeros no circulo
                Text("\(numbers[0])")
                    .font(.system(size: geometry.size.width * 0.12, weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(-70))
                    .position(x: geometry.size.width * 0.82, y: geometry.size.height * 1.24)
                    
                
                Text("\(numbers[1])")
                    .font(.system(size: geometry.size.width * 0.12, weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(-23))
                    .position(x: geometry.size.width * 1.05, y: geometry.size.height * 0.89)
                
                Text("\(numbers[2])")
                    .font(.system(size: geometry.size.width * 0.12, weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(25))
                    .position(x: geometry.size.width * 1.43, y: geometry.size.height * 0.89)
                
                Text("\(numbers[3])")
                    .font(.system(size: geometry.size.width * 0.12, weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(68))
                    .position(x: geometry.size.width * 1.69, y: geometry.size.height * 1.24)
                
                Text("\(numbers[4])")
                    .font(.system(size: geometry.size.width * 0.12, weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(115))
                    .position(x: geometry.size.width * 1.68, y: geometry.size.height * 1.74)
                
                Text("\(numbers[5])")
                    .font(.system(size: geometry.size.width * 0.12, weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(155))
                    .position(x: geometry.size.width * 1.43, y: geometry.size.height * 2.11)
                
                Text("\(numbers[6])")
                    .font(.system(size: geometry.size.width * 0.12, weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(204))
                    .position(x: geometry.size.width * 1.08, y: geometry.size.height * 2.11)
                
                Text("\(numbers[7])")
                    .font(.system(size: geometry.size.width * 0.12, weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(250))
                    .position(x: geometry.size.width * 0.83, y: geometry.size.height * 1.75)
            }.rotationEffect(.degrees(rotationCicle), anchor: .center)
                .position(x: geometry.size.width * 0.9, y: geometry.size.height * 1.25)
        }
    }
}

