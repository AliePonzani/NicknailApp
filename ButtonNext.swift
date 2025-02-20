//
//  SwiftUIView.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 14/02/25.
//

import SwiftUI

struct ButtonNext: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var iconButton: String
    var operation: String
    var heightButton: Double
    
    var body: some View {
        Button(action: {
            viewModel.generateScene(operation: operation)
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


