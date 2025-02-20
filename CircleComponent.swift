//
//  SwiftUIView 2.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 18/02/25.
//

import SwiftUI

struct CircleComponent: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    private let rotations: [Int] = [-70, -23, 25, 68, 115, 155, 204, 250]
    private let widties: [Double] = [0.8, 1.07, 1.43, 1.7, 1.7, 1.43, 1.07, 0.8]
    private let heighties: [Double] = [1.24, 0.88, 0.88, 1.24, 1.76, 2.11, 2.11, 1.76]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("circlePlay")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 2.5, height: geometry.size.height * 3)
                    .clipped()
                
                ForEach(0...7, id: \.self){ index in
                    
                    Text("\(viewModel.fibonacciNumbers[index])")
                        .font(.system(size: min(geometry.size.width * 0.12, max(geometry.size.width * 0.12 - CGFloat("\(viewModel.fibonacciNumbers[index])".count) * 10, 12)), weight: .bold, design: .rounded))
                        .rotationEffect(.degrees(Double(rotations[index])))
                        .position(x: geometry.size.width * widties[index], y: geometry.size.height * heighties[index])
                }
                
            }.rotationEffect(.degrees(viewModel.rotationCicle), anchor: .center)
                .position(x: geometry.size.width * 0.95, y: geometry.size.height * 1.21)
        }
    }
}

