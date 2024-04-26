//
//  ImageParalax.swift
//  Components
//
//  Created by 강치우 on 1/9/24.
//

import SwiftUI

struct ImageParalax: View {
    @State var ValueTranslation: CGSize = .zero
    @State var isDragging = false
    
    var body: some View {
        ZStack {
            Image("stars")
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 550)
                .offset(x: ValueTranslation.width / 10, y: ValueTranslation.height / 10)
            
            Image("planet")
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 250)
                .offset(x: ValueTranslation.width / 5, y: ValueTranslation.height / 5)
            
            Circle()
                .frame(width: 50, height: 50)
                .blur(radius: 50)
                .offset(x: ValueTranslation.width / 1.5, y: ValueTranslation.height / 1.5)
            
        }
        .offset(x: ValueTranslation.width / 10, y: ValueTranslation.height / 10)
        .frame(width: 300, height: 400)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .rotation3DEffect(
            .degrees(isDragging ? 10 : 0),
            axis: (x: -ValueTranslation.height, y: ValueTranslation.width, z: 0.0)
        )
        .gesture(DragGesture()
            .onChanged({ value in
                withAnimation {
                    ValueTranslation = value.translation
                    isDragging = true
                }
            })
                .onEnded({ value in
                    withAnimation {
                        ValueTranslation = .zero
                        isDragging = false
                    }
                })
        )
    }
}

#Preview {
    ImageParalax()
}
