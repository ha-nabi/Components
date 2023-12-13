//
//  DLMode.swift
//  Components
//
//  Created by 강치우 on 12/12/23.
//

import SwiftUI

struct DLMode: View {
    
    @Binding var appearanceMode: AppearanceMode
    @Binding var colorScheme: ColorScheme?
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            Color(show ? .clear : .gray.opacity(0.3))
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(height: 270)
                        .foregroundStyle(.background)
                    VStack(spacing: 20) {
                        HStack {
                            Text("Appearance")
                            
                            Spacer()
                            
                            Image(systemName: "xmark.circle.fill")
                        }
                        .bold()
                        .font(.title)
                        .foregroundStyle(.primary)
                        .padding(.horizontal)
                        
                        Divider()
                            .padding(.horizontal, 30)
                        
                        HStack(spacing: 40) {
                            
                            // Light Mode
                            Button {
                                appearanceMode = .light
                                colorScheme = .light
                            } label: {
                                UIButton(mode: .light, currentMode: $appearanceMode, Rbg: Color(.systemGray2), Rbgi: Color(.systemGray4), ibg: .white)
                            }
                            .tint(.primary)
                            
                            // Dark Mode
                            Button {
                                appearanceMode = .dark
                                colorScheme = .dark
                            } label: {
                                UIButton(mode: .dark, currentMode: $appearanceMode, Rbg: Color(.systemGray), Rbgi: Color(.systemGray4), ibg: .black)
                            }
                            .tint(.primary)
                            
                            // System Mode
                            ZStack {
                                UIButton(mode: .system, currentMode: $appearanceMode, Rbg: Color(.systemGray2), Rbgi: Color(.systemGray4), ibg: .white)
                                UIButton(mode: .system, currentMode: $appearanceMode, Rbg: Color(.systemGray2), Rbgi: Color(.systemGray3), ibg: .black)
                                    .mask {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 50, height: 200)
                                            .offset(x: -24)
                                    }
                            }
                            .onTapGesture {
                                appearanceMode = .system
                                colorScheme = nil
                            }
                        }
                    }
                }
                .padding(.horizontal, 8)
                .preferredColorScheme(colorScheme)
                
            }
            .offset(y: show ? 300 : -30)
        }
        .onTapGesture {
            show.toggle()
        }
    }
}

#Preview {
    DLMode(appearanceMode: .constant(.dark), colorScheme: .constant(.dark), show: .constant(false))
}

enum AppearanceMode {
    case dark, light, system
}


struct UIButton: View {
    var mode: AppearanceMode
    @Binding var currentMode: AppearanceMode
    
    var Rbg: Color
    var Rbgi: Color
    var ibg: Color
    
    var body: some View {
        VStack(spacing: 20 ) {
            VStack {
                Circle()
                    .frame(width: 20, height: 20)
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 49, height: 6)
                VStack(spacing: 5) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 38, height: 6)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 38, height: 6)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 38, height: 6)
                }
                .frame(width: 55, height: 50)
                .background(ibg, in: RoundedRectangle(cornerRadius: 5))
            }
            .foregroundStyle(Rbgi)
            .padding(8)
            .overlay {
                if currentMode == mode {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .padding(-3)
                }
            }
            
            .background(Rbg, in: RoundedRectangle(cornerRadius: 7))
            
            Text(String(describing: mode).capitalized)
                .foregroundStyle(currentMode == mode ? .white : .black)
                .font(.system(size: 15))
                .frame(width: 88, height: 25)
                .background(currentMode == mode ? .black : .gray, in: RoundedRectangle(cornerRadius: 10))
            
        }
        .scaleEffect(currentMode == mode ? 1.1 : 0.9)
        .animation(.default, value: currentMode)
    }
}
