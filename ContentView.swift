import SwiftUI

struct ContentView: View {
    @State private var scene = "scene1"
    @State private var counter = 1
    @Binding var playGame: Bool
    
    var body: some View {
        GeometryReader { geometry in
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
                                    print(index)
                                    
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
                                .foregroundColor(Color.black)
                        }.frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.1).padding(10).background(Color.accentColor).cornerRadius(10)
                        Button(action:{
                            counter = 1
                            scene = "scene1"
                        }){
                            Text("WATCH AGAIN")
                                .font(.system(size: 50, weight: .bold, design: .rounded))
                                .foregroundColor(Color.black)
                        }.frame(width: geometry.size.width * 0.3, height: geometry.size.width * 0.1).padding().background(Color.accentColor).cornerRadius(10)
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
                                ButtonNext(iconButton: "allLeft", operation: "returnall", scene: $scene, counter: $counter, geometry: geometry).padding(.horizontal, 10)
                            }
                            ButtonNext(iconButton: "leftt", operation: "subtract", scene: $scene, counter: $counter, geometry: geometry)
                        }
                        
                        Spacer()
                        
                        if counter <= 18{
                            ButtonNext(iconButton: "rigth", operation: "add", scene: $scene, counter: $counter, geometry: geometry)
                            ButtonNext(iconButton: "allRigth", operation: "nextall", scene: $scene, counter: $counter, geometry: geometry).padding(.horizontal, 10)
                        }
                    }
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

