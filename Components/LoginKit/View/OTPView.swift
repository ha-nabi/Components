//
//  OTPView.swift
//  Components
//
//  Created by 강치우 on 11/5/23.
//

import SwiftUI

struct OTPView: View {
    @Binding var otpText: String
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
            .padding(.top, 15)
            Text("Enter OTP")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            Text("An 6 digit code has been sent to your Email ID.")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                // Custom OTP TextField
                OTPVerificationView(otpText: $otpText)
        
                // Sign Up Button
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    // 코드 입력
                }
                .hSpacing(.trailing)
                // 데이터가 입력될 때까지 비활성화
                .disableWithOpacity(otpText.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        // Since this is going to be a Sheet.
        .interactiveDismissDisabled()
    }
}

#Preview {
    ContentView()
}
