//
//  VanDarView.swift
//  Components
//
//  Created by 강치우 on 12/11/23.
//

import SwiftUI

struct VanDarView: View {
    @Binding var isScroll: Bool
    
    var body: some View {
        ZStack {
            Color.clear
                .frame(height: isScroll ? 90 : 100)
                .background(.ultraThinMaterial)
                .opacity(isScroll ? 1 : 0)
                .blur(radius: 0.5)
                .ignoresSafeArea()
            // MARK: - 네비게이션 타이틀
            HStack {
                Text("HomeView")
                    .bold()
                    .font(.system(size: isScroll ? 22 : 32))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "person.circle.fill")
                    .font(isScroll ? .title : .largeTitle)
            }
            .offset(y: isScroll ? -30 : -25)
            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}
