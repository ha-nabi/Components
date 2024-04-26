//
//  ForgotPassword.swift
//  Components
//
//  Created by 강치우 on 11/5/23.
//

import SwiftUI

struct ForgotPassword: View {
    @Binding var showResetView: Bool
    // View Properties
    @State private var emailID: String = ""
    // Environment Properties
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            // Back Button
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            Text("Forgot Password?")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("Please enter your Email ID so that we can send the reset link")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                // Custom Text Fields
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
        
                // Sign Up Button
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    // YOUR CODE
                    // After the Link sent
                    Task {
                        dismiss()
                        try? await Task.sleep(for: .seconds(0))
                        // 재설정 보기를 표시
                        showResetView = true
                    }
                }
                .hSpacing(.trailing)
                // 데이터가 입력될 때까지 사용 안 함
                .disableWithOpacity(emailID.isEmpty)
            }
            .padding(.top, 20)
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        // Since this is going to be a Sheet.
        .interactiveDismissDisabled()
    }
}
