//
//  SwiftUIView.swift
//  Nicknail
//
//  Created by ALINE FERNANDA PONZANI on 18/02/25.
//

import SwiftUI

struct SwiftUIView: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("circlePlay")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width * 2, height: geometry.size.height * 2)
                    .clipped()
            }.background(.blue)
        }.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SwiftUIView()
}
