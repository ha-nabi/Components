//
//  glassmorphism.swift
//  Components
//
//  Created by 강치우 on 12/26/23.
//

import SwiftUI

struct Glassmorphism: View {
    
    var body: some View {
        VStack {
            VStack(spacing: 12) {
                Image("pp1")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(60)
                    .font(.system(size: 55))
                
               Text("RangSung")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                
                Text("@dearkang")
                    .foregroundStyle(.gray)
                    .fontWeight(.medium)
                    .font(.system(size: 20))
                Text("")
            }
            .padding(.horizontal, 80)
            .padding(.top, 75)
            .padding(.bottom, 55)
            .background {
                TransparentBlur(removeAllFilters: true)
                    .blur(radius: 9, opaque: true)
                    .background(.gray.opacity(0.15))
            }
            .clipShape(.rect(cornerRadius: 10, style: .continuous))
            
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.white.opacity(0.3), lineWidth: 2)
            }
            .background {
                ZStack {
                    Circle()
                        .fill(
                            .linearGradient(colors: [
                            .orange,
                            .green
                        ], startPoint: .top, endPoint: .bottom)
                        )
                        .frame(width: 270, height: 270)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .offset(x: 5, y: -105)
                }
            }
        }
        .padding(.horizontal, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Rectangle()
                .fill(.black)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    Glassmorphism()
        .preferredColorScheme(.dark)
}
