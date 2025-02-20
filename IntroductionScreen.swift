import SwiftUI
import ConfettiSwiftUI

struct IntroductionScreen: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    @State private var index = 1
    @State private var timer: Timer.TimerPublisher = Timer.publish(every: 1, on: .main, in: .common)
        
    var body: some View {
        ZStack{
            if viewModel.sceneCounter == 14 {
                VStack {
                    Image(viewModel.sceneGame)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .onReceive(timer) { _ in
                                    if index < 5 {
                                        print("index é \(index)")
                                        viewModel.sceneGame = "scene14-\(index)"
                                        index += 1
                                    } else {
                                        viewModel.sceneCounter = 15
                                        viewModel.sceneGame = "scene\(viewModel.sceneCounter)"
                                        timer.connect().cancel()
                                    }
                                }
                                .onAppear {
                                    let _ = timer.connect()
                                }
                }
                
            } else if viewModel.sceneCounter == 17 {
                Image(viewModel.sceneGame)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack(spacing: 25){
                    Button(action: {
                        viewModel.playGame = true
                    }){
                        Text("PLAY")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                    }
                    .frame(width: 400, height: 150)
                    .padding(10)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    
                    Button(action:{
                        viewModel.sceneCounter = 1
                        viewModel.sceneGame = "scene1"
                    }){
                        Text("WATCH AGAIN")
                            .font(.system(size: 50, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                    }
                    .frame(width: 400, height: 150)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                }
            }
            else {
                Image(viewModel.sceneGame)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                HStack{
                    if viewModel.sceneCounter > 1 {
                        ButtonNext(iconButton: "allLeft", operation: "returnall", heightButton: 60)
                        ButtonNext(iconButton: "leftt", operation: "subtract", heightButton: 100)
                    }
                    
                    Spacer()
                    
                    if viewModel.sceneCounter <= 18{
                        ButtonNext(iconButton: "rigth", operation: "add", heightButton:100)
                        ButtonNext(iconButton: "allRigth", operation: "nextall", heightButton: 60)
                    }
                }.padding(.horizontal, 20)
            }
        }
    }
}

