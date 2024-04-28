//
//  ButtonView.swift
//  Components
//
//  Created by 강치우 on 12/12/23.
//

import SwiftUI

struct ButtonView: View {
    @State private var appearanceMode: AppearanceMode = .dark
    @State private var colorScheme: ColorScheme? = nil
    @State var show = true
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "lightbulb.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                Text("Hello, World!")
                    .foregroundStyle(.primary)
                
                Button {
                    withAnimation {
                        show.toggle()
                    }
                } label: {
                    Text("Appearance")
                    
                        .bold()
                        .font(.title2)
                        .frame(width: 200, height: 60)
                        .background(.black, in: RoundedRectangle(cornerRadius: 20))
                }
                .tint(.white)
            }
            
            DLMode(appearanceMode: $appearanceMode, colorScheme: $colorScheme, show: $show)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ButtonView()
}
