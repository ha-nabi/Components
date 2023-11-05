//
//  ContentView.swift
//  LoginKit
//
//  Created by 강치우 on 11/5/23.
//

import SwiftUI

struct ContentView: View {
    // View Properties
    @State private var showSignup: Bool = false
    // KeyBoard Status
    @State private var isKeyboardShowing: Bool = false
    var body: some View {
        NavigationStack {
            Login(showSignup: $showSignup)
                .navigationDestination(isPresented: $showSignup) {
                    Signup(showSignup: $showSignup)
                }
            // Checking if any Keyboard is Visible
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification), perform: { _ in
                    // Disabling it for signup view
                    if !showSignup {
                        isKeyboardShowing = true
                    }
                })
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification), perform: { _ in
                    isKeyboardShowing = false
                })
        }
        .overlay {
            // iOS 17 Bounce Animations
            if #available(iOS 17, *) {
                // Since this Project Suppors iOS 16 too.
                CircleView()
                    .animation(.smooth(duration: 0.45, extraBounce: 0), value: isKeyboardShowing)
            } else {
                CircleView()
                    .animation(.easeOut(duration: 0.3), value: showSignup)
                    .animation(.easeOut(duration: 0.3), value: isKeyboardShowing)

            }
            
        }
    }
    
        // Moving Blurred background
    @ViewBuilder
    func CircleView() -> some View {
        Circle()
            .fill(LinearGradient(colors: [.yellow, .orange, .red], startPoint: .top, endPoint: .bottom))
            .frame(width: 200, height: 200)
        // Moving When the Signup Pages Loads/Dismisses
            .offset(x: showSignup ? 90 : -90, y: -90 - (isKeyboardShowing ? 200 : 0) )
            .blur(radius: 15)
            .hSpacing(showSignup ? .trailing : .leading)
            .vSpacing(.top)
    }
}

#Preview {
    ContentView()
}
