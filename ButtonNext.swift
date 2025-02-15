//
//  SwiftUIView.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 14/02/25.
//

import SwiftUI

struct ButtonNext: View {
    @State var iconButton: String
    @State var operation: String
    @Binding var scene: String
    @Binding var counter: Int
    var geometry: GeometryProxy
    var body: some View {
            Button(action: {
                if counter != 0 {
                    if operation == "add" {
                        counter += 1
                    } else if operation == "subtract" {
                        counter -= 1
                    } else if operation == "returnall" {
                        counter = 1
                    }else if operation == "nextall" {
                        counter = 19
                    }
                }
                
                scene = "scene\(counter)"
                print(scene)
            }){
                Image(systemName: iconButton)
                    .resizable()
                    .foregroundColor(.gray)
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.05)
            }.frame(maxHeight: .infinity)
            .frame( width: geometry.size.width * 0.05)
        }
    
}


