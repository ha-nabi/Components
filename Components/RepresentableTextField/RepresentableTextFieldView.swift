//
//  RepresentableTextFieldView.swift
//  Components
//
//  Created by 강치우 on 2/9/24.
//

import SwiftUI

struct RepresentableTextFieldView: View {
    @State private var text = ""
    @State private var focus = false
    
    @FocusState private var isTextFieldFocused: Bool
    var body: some View {
        VStack {
            Text("타이틀")
                .font(.title)
                .fontWeight(.bold)
            RepresentableTextField(placeHolderString: "안녕", keyboardType: .default, text: $text, isFocused: $focus)
                .frame(height: 50)
                .focused($isTextFieldFocused)
                .onAppear {
                    isTextFieldFocused = true
                }
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 3)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    RepresentableTextFieldView()
}
