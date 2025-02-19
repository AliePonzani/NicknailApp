//
//  SwiftUIView 2.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 18/02/25.
//

import SwiftUI

struct CircleComponent: View {
    @Binding var fibonacciNumbers: [Int]
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
                Text("\(fibonacciNumbers[0])")
                    .font(.system(size: min(geometry.size.width * 0.12, max(geometry.size.width * 0.12 - CGFloat("\(fibonacciNumbers[0])".count) * 10, 12)), weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(-70))
                    .position(x: geometry.size.width * 0.82, y: geometry.size.height * 1.24)
                
                
                
                
                Text("\(fibonacciNumbers[1])")
                    .font(.system(size: min(geometry.size.width * 0.12, max(geometry.size.width * 0.12 - CGFloat("\(fibonacciNumbers[0])".count) * 10, 12)), weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(-23))
                    .position(x: geometry.size.width * 1.07, y: geometry.size.height * 0.88)
                
                Text("\(fibonacciNumbers[2])")
                    .font(.system(size: min(geometry.size.width * 0.12, max(geometry.size.width * 0.12 - CGFloat("\(fibonacciNumbers[0])".count) * 10, 12)), weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(25))
                    .position(x: geometry.size.width * 1.43, y: geometry.size.height * 0.89)
                
                Text("\(fibonacciNumbers[3])")
                    .font(.system(size: min(geometry.size.width * 0.12, max(geometry.size.width * 0.12 - CGFloat("\(fibonacciNumbers[0])".count) * 10, 12)), weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(68))
                    .position(x: geometry.size.width * 1.68, y: geometry.size.height * 1.24)
                
                Text("\(fibonacciNumbers[4])")
                    .font(.system(size: min(geometry.size.width * 0.12, max(geometry.size.width * 0.12 - CGFloat("\(fibonacciNumbers[0])".count) * 10, 12)), weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(115))
                    .position(x: geometry.size.width * 1.68, y: geometry.size.height * 1.76)
                
                Text("\(fibonacciNumbers[5])")
                    .font(.system(size: min(geometry.size.width * 0.12, max(geometry.size.width * 0.12 - CGFloat("\(fibonacciNumbers[0])".count) * 10, 12)), weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(155))
                    .position(x: geometry.size.width * 1.43, y: geometry.size.height * 2.11)
                
                Text("\(fibonacciNumbers[6])")
                    .font(.system(size: min(geometry.size.width * 0.12, max(geometry.size.width * 0.12 - CGFloat("\(fibonacciNumbers[0])".count) * 10, 12)), weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(204))
                    .position(x: geometry.size.width * 1.07, y: geometry.size.height * 2.11)
                
                Text("\(fibonacciNumbers[7])")
                    .font(.system(size: min(geometry.size.width * 0.12, max(geometry.size.width * 0.12 - CGFloat("\(fibonacciNumbers[0])".count) * 10, 12)), weight: .bold, design: .rounded))
                    .rotationEffect(.degrees(250))
                    .position(x: geometry.size.width * 0.82, y: geometry.size.height * 1.75)
                
                
            }.rotationEffect(.degrees(rotationCicle), anchor: .center)
                .position(x: geometry.size.width * 0.95, y: geometry.size.height * 1.21)
        }
    }
}

