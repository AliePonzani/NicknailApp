//
//  SwiftUIView.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 18/02/25.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var rotationCicle: Double = 0
    @State private var fibonacciNumbers = [0, 1, 1, 2, 3, 5, 8, 13]
    @State private var prior: Int = 6
    @State private var preceding: Int = 5
    
    @State private var score: Int = 0
    @State private var highScore: Int = 0
    
    @State private var count: Int = 2
    @State private var button1 = 1
    @State private var button2 = 2
    @State private var button3 = 3
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading){
                
                LinearGradient(gradient: Gradient(colors: [Color("skyLigth"), Color("skyColor")]), startPoint: .bottomTrailing, endPoint: .topLeading)
                
                CircleComponent(fibonacciNumbers: $fibonacciNumbers, rotationCicle: $rotationCicle)
                
                
                Image("nicknail")
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
                        Button(action:{
                            let result = checkResult(answer: button1)
                            if result {
                                rotateScreen()
                                if count == 7 {
                                    count = 0
                                } else {
                                    count += 1
                                }
                                randomizeButtons()
                                score += 1
                            } else {
                                print("vc errou")
                            }
                        }){
                            ZStack{
                                Image("buttonYellow").resizable()
                                    .scaledToFit()
                                Text("\(button1)")
                                    .font(.system(size: min(geometry.size.width * 0.09, max(geometry.size.width * 0.09 - CGFloat("\(button1)".count) * 12, 12)), weight: .bold, design: .rounded))
                            }
                        }
                        Button(action:{
                            let result = checkResult(answer: button2)
                            if result {
                                rotateScreen()
                                if count == 7 {
                                    count = 0
                                } else {
                                    count += 1
                                }
                                randomizeButtons()
                                score += 1
                            } else {
                                print("vc errou")
                            }
                        }){
                            ZStack{
                                Image("buttonRed").resizable()
                                    .scaledToFit()
                                Text("\(button2)")
                                    .font(.system(size: min(geometry.size.width * 0.09, max(geometry.size.width * 0.09 - CGFloat("\(button2)".count) * 12, 12)), weight: .bold, design: .rounded))
                            }
                        }
                        
                        
                        Button(action:{
                            let result = checkResult(answer: button3)
                            if result {
                                rotateScreen()
                                if count == 7 {
                                    count = 0
                                } else {
                                    count += 1
                                }
                                randomizeButtons()
                                score += 1
                            } else {
                                print("vc errou")
                            }
                        }){
                            ZStack{
                                Image("buttonBlue").resizable()
                                    .scaledToFit()
                                Text("\(button3)")
                                    .font(.system(size: min(geometry.size.width * 0.09, max(geometry.size.width * 0.09 - CGFloat("\(button3)".count) * 12, 12)), weight: .bold, design: .rounded))
                            }
                        }
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
                            Text("\(score)")
                            Text("\(score)")
                            Spacer()
                        }.padding(.vertical, 50)
                        
                    }.font(.system(size: geometry.size.width * 0.03, weight: .bold, design: .rounded)).padding(.horizontal, 50)
                }
            }.background(Color("skyColor"))
        }.edgesIgnoringSafeArea(.all)
    }
    
    func randomizeButtons() {
        let correctAnswer = fibonacciNumbers[count]
        var randomButtons = Set<Int>()
        
        randomButtons.insert(correctAnswer)
        
        while randomButtons.count < 3 {
            let randomValue = Int.random(in: correctAnswer...(correctAnswer + 10))
            randomButtons.insert(randomValue)
        }
        
        let randomButtonsArray = Array(randomButtons).shuffled()
        
        button1 = randomButtonsArray[0]
        button2 = randomButtonsArray[1]
        button3 = randomButtonsArray[2]
    }
    
    func checkResult(answer: Int) -> Bool {
        if answer == fibonacciNumbers[count] {
            return true
        } else {
            return false
        }
    }
    
    func rotateScreen() {
        withAnimation(.easeInOut(duration: 1)) {
            rotationCicle -= 45
            
            let calc = fibonacciNumbers[prior] + fibonacciNumbers[preceding]
            preceding = prior
            
            if prior == 7 {
                prior = 0
            } else {
                prior += 1
            }
            fibonacciNumbers[prior] = calc
        }
    }
}

#Preview {
    SwiftUIView()
}
