//
//  ContentView.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 14/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var scene = "scene1"
    @State private var counter = 1
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image(scene)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                HStack{
                    if counter > 1 {
                        if counter >= 2{
                            ButtonNext(iconButton: "chevron.left.2", operation: "returnall", scene: $scene, counter: $counter, geometry: geometry).padding(.horizontal, 15)
                        }
                        ButtonNext(iconButton: "chevron.backward", operation: "subtract", scene: $scene, counter: $counter, geometry: geometry)
                    }
                    Spacer()
                    if counter <= 18{
                        ButtonNext(iconButton: "chevron.forward", operation: "add", scene: $scene, counter: $counter, geometry: geometry)
                        ButtonNext(iconButton: "chevron.right.2", operation: "nextall", scene: $scene, counter: $counter, geometry: geometry).padding(.horizontal, 15)
                    }
                    
                }
            }
        }.edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    ContentView()
}
