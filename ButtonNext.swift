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
    var heightButton: Double
    var body: some View {
        Button(action: {
            print(counter)
            if counter != 0 {
                if operation == "add" {
                    counter += 1
                } else if operation == "subtract" {
                    counter -= 1
                } else if operation == "returnall" {
                    counter = 1
                }else if operation == "nextall" {
                    counter = 17
                }
                scene = "scene\(counter)"
            }
        }){
            HStack{
                Image(iconButton)
                    .resizable()
                    .scaledToFit()
                    .frame(height: heightButton)
            }
        }
    }
    
}


