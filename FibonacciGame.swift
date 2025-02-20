import SwiftUI
import ConfettiSwiftUI

struct FibonacciGame: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center){
                
                LinearGradient(gradient: Gradient(colors: [Color("skyLigth"), Color("skyColor")]), startPoint: .bottomTrailing, endPoint: .topLeading)
                
                CircleComponent()
           
                Image(viewModel.nicknailImage)
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.degrees(-39))
                    .frame(width: geometry.size.width * 0.44)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                
                HStack{
                    // Componente dos números
                    VStack(spacing: 20){
                        Text("What is the next number ?")
                            .font(.system(size: 27, weight: .bold, design: .rounded))
                            .multilineTextAlignment(.center)
                        ButtonGame(imageButton: "buttonYellow", answer: viewModel.button1)
                        ButtonGame(imageButton: "buttonRed", answer: viewModel.button2)
                        ButtonGame(imageButton: "buttonBlue", answer: viewModel.button3)
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal, 30)
                    .frame(width: geometry.size.width * 0.25)
                    
                    Spacer()
                    
                    HStack{
                        VStack(alignment: .trailing){
                            Text("HIGH SCORE: ")
                            Text("SCORE: ")
                            Spacer()
                        }
                        .padding(.vertical, 50)
                        VStack(alignment: .leading){
                            Text("\(viewModel.highScore)")
                            Text("\(viewModel.score)")
                            Spacer()
                        }
                        .padding(.vertical, 50)
                        
                    }
                    .font(.system(size: geometry.size.width * 0.03, weight: .bold, design: .rounded))
                    .padding(.horizontal, 50)
                }
                
            }
            .sheet(isPresented: $viewModel.newHightScore) {
                CustomModalView()
            }
            .background(Color("skyColor"))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    FibonacciGame()
}
