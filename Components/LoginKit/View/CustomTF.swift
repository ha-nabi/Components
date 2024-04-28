//
//  CustomTF.swift
//  LoginKit
//
//  Created by 강치우 on 11/5/23.
//

import SwiftUI

struct CustomTF: View {
    var sfIcon: String
    var iconTint: Color = .gray
    var hint: String
    // Hides TextField
    var isPassword: Bool = false
    
    @Binding var value: String
    
    @State private var showPassword: Bool = false
    var body: some View {
        HStack(alignment: .top, spacing: 8, content: {
            Image(systemName: sfIcon)
                .foregroundStyle(iconTint)
            // 텍스트 필드를 동일하게 정렬하려면 동일한 너비가 필요함
                .frame(width: 30)
            // 살짝 다운시키기
                .offset(y: 2)
            
            VStack(alignment: .leading, spacing: 8, content: {
                if isPassword {
                    Group {
                        // 사용자가 암호를 표시할 때 암호를 표시
                        if showPassword {
                            TextField(hint, text: $value)
                        } else {
                            SecureField(hint, text: $value)
                        }
                    }
                } else {
                    TextField(hint, text: $value)
                }
                
                Divider()
            })
            .overlay(alignment: .trailing) {
                // 비밀번호 공개 버튼
                if isPassword {
                    Button {
                        withAnimation {
                            showPassword.toggle()
                        }
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundStyle(.gray)
                            .padding(10)
                            .contentShape(.rect)
                    }
                }
            }
        })
    }
}
