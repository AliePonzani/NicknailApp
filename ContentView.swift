import SwiftUI

struct ContentView: View {
    @State private var scene = "scene1"
    @State private var counter = 1
    @Binding var playGame: Bool
    
    var body: some View {
        ZStack{
            if counter == 14 {
                // Exibe as próximas 4 cenas com delay de 1 segundo entre elas
                VStack {
                    ForEach(1...5, id: \.self) { index in
                        Image(scene)
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                            .onAppear {
                                if index == 5 {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 1) {
                                        counter = 15
                                        scene = "scene\(counter)"
                                    }
                                } else {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 1) {
                                        self.scene = "scene14-\(index)"
                                    }
                                }
                            }
                    }
                }
            } else if counter == 17 {
                Image(scene)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack(spacing: 25){
                    Button(action: {
                        playGame.toggle()
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
                        counter = 1
                        scene = "scene1"
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
                Image(scene)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                HStack{
                    if counter > 1 {
                        if counter >= 2{
                            ButtonNext(iconButton: "allLeft", operation: "returnall", scene: $scene, counter: $counter, heightButton: 60)
                        }
                        ButtonNext(iconButton: "leftt", operation: "subtract", scene: $scene, counter: $counter, heightButton: 100)
                    }
                    
                    Spacer()
                    
                    if counter <= 18{
                        ButtonNext(iconButton: "rigth", operation: "add", scene: $scene, counter: $counter, heightButton:100)
                        ButtonNext(iconButton: "allRigth", operation: "nextall", scene: $scene, counter: $counter, heightButton: 60)
                    }
                }.padding(.horizontal, 20)
            }
        }
    }
}

