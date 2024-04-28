//
//  samples.swift
//  Components
//
//  Created by 강치우 on 2/17/24.
//

import SwiftUI

struct samples: View {
    @State var width = UIScreen.main.bounds.width
    @State var menu = "suggestions"
    
    @Binding var mainMenu: String
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                if menu == "suggestions" {
                    
                } else if menu == "friends" {
                    
                }
                
                VStack {
                    Spacer()
                    ZStack {
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 22)
                                    .frame(width: width * 0.38, height: 40)
                                    .foregroundStyle(Color(red: 20/255, green: 20/255, blue: 20/255))
                                
                                HStack(spacing: 4) {
                                    Capsule()
                                        .frame(width: 65, height: 28)
                                        .foregroundStyle(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == "suggestions" ? 1: 0)
                                        .overlay {
                                            Text("팔로워")
                                                .foregroundStyle(.white)
                                                .font(.system(size: 14))
                                        }
                                        .onTapGesture {
                                            self.menu = "suggestions"
                                        }
                                    
                                    Capsule()
                                        .frame(width: 65, height: 28)
                                        .foregroundStyle(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == "friends" ? 1: 0)
                                        .overlay {
                                            Text("팔로잉")
                                                .foregroundStyle(.white)
                                                .font(.system(size: 14))
                                        }
                                        .onTapGesture {
                                            self.menu = "friends"
                                        }
                                }
                            }
                        }
                        .zIndex(1)
                        
                        LinearGradient(colors: [.black, .white.opacity(0)], startPoint: .bottom, endPoint: .top)
                            .ignoresSafeArea()
                            .frame(height: 60)
                            .opacity(0.9)
                    }
                }
            }
        }
    }
}
