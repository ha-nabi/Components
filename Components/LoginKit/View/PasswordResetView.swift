//
//  PasswordResetView.swift
//  Components
//
//  Created by 강치우 on 11/5/23.
//

import SwiftUI

struct PasswordResetView: View {
    // View Properties
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    // Environment Properties
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            // Back Button
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundStyle(.gray)
            })
            .padding(.top, 10)
            Text("Reset Password?")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            
            VStack(spacing: 25) {
                // Custom Text Fields
                CustomTF(sfIcon: "lock", hint: "Password", value: $password)
        
                CustomTF(sfIcon: "lock", hint: "ConfirmPassword", value: $confirmPassword)
                    .padding(.top, 5)

                // Sign Up Button
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    // YOUR CODE
                    // Reset Passowrd
                }
                .hSpacing(.trailing)
                // Disabling Until the Data is Entered
                .disableWithOpacity(password.isEmpty || confirmPassword.isEmpty)
            }
            .padding(.top, 20)
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
