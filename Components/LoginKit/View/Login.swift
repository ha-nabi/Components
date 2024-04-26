//
//  Login.swift
//  LoginKit
//
//  Created by 강치우 on 11/5/23.
//

import SwiftUI

struct Login: View {
    @Binding var showSignup: Bool
    // View Properties
    @State private var emailID: String = ""
    @State private var password: String = ""
    @State private var showForgotPasswordView: Bool = false
    // Reset Password View (with New Password and Confimration Password View)
    @State private var showResetView: Bool = false
    // Optional, Present If you want to ask OTP for login
    @State private var askOtp: Bool = false
    @State private var otpText: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Spacer()
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("Please sign in to contiune")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding(.top, -5)
            
            VStack(spacing: 25) {
                // Custom Text Fields
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)
                
                // Forgot Password Button
                Button("Forgot Password?") {
                    showForgotPasswordView.toggle()
                }
                .font(.callout)
                .fontWeight(.heavy)
                .tint(.orange)
                .hSpacing(.trailing)
                
                
                // Login Button
                GradientButton(title: "Login", icon: "arrow.right") {
                    // YOUR CODE
                    askOtp.toggle()
                }
                .hSpacing(.trailing)
                // Disabling Until the Data is Entered
                .disableWithOpacity(emailID.isEmpty || password.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer()
            
            HStack(spacing: 6) {
                Text("Don't have an account?")
                    .foregroundStyle(.gray)
                
                Button("SignUp") {
                    showSignup.toggle()
                }
                .fontWeight(.bold)
                .tint(.orange)
            }
            .font(.callout)
            .hSpacing()
        })
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        // 재설정 링크를 보내기 위한 이메일 링크 표시
        .sheet(isPresented: $showForgotPasswordView, content: {
            if #available(iOS 16.4, *) {
                // Since i wanted a Custom Sheet Coner Radius
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
                    .presentationCornerRadius(30)
            } else {
                ForgotPassword(showResetView: $showResetView)
                    .presentationDetents([.height(300)])
            }
        })
        // 새 암호 재설정
        .sheet(isPresented: $showResetView, content: {
            if #available(iOS 16.4, *) {
                // Since i wanted a Custom Sheet Coner Radius
                PasswordResetView()
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                PasswordResetView()
                    .presentationDetents([.height(350)])
            }
        })
        // OTP Prompt
        .sheet(isPresented: $askOtp, content: {
            if #available(iOS 16.4, *) {
                // Since i wanted a Custom Sheet Coner Radius
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
            }
        })
    }
}
