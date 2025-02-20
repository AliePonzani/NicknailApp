import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    
//    @State private var timer: Timer? = nil
//    
//    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
//                        if currentIndex < texts.count - 1 {
//                            currentIndex += 1 // Avança para o próximo texto
//                        } else {
//                            timer?.invalidate() // Para o timer quando todos os textos forem exibidos
//                        }
//                    }
   
    var body: some View {
        ZStack{
            if viewModel.sceneCounter == 14 {
                // Exibe as próximas 4 cenas com delay de 1 segundo entre elas
                VStack {
                    ForEach(1...5, id: \.self){ index in
                        Image(viewModel.sceneGame)
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                            .onAppear {
                                if index == 5 {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 1) {
                                        viewModel.sceneCounter = 15
                                        viewModel.sceneGame = "scene\(viewModel.sceneCounter)"
                                    }
                                } else {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 1) {
                                        self.viewModel.sceneGame = "viewModel.scene14-\(index)"
                                    }
                                }
                            }
                    }
                }
            } else if viewModel.sceneCounter == 17 {
                Image(viewModel.sceneGame)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack(spacing: 25){
                    Button(action: {
                        viewModel.playGame.toggle()
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

