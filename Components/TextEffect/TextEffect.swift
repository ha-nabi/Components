//
//  TextEffect.swift
//  Components
//
//  Created by 강치우 on 12/29/23.
//

import SwiftUI

struct TextEffect: View {
    
    let text: String
    @State private var displayedCharacters = ""
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text(displayedCharacters)
            .font(Font.custom("Bebas Neue", size: 45))

            .bold()
            .onReceive(timer) { _ in
                if displayedCharacters.count < text.count {
                    let index = text.index(text.startIndex, offsetBy: displayedCharacters.count)
                    displayedCharacters.append(text[index])
                }
            }
    }
}

#Preview {
    TextEffect(text: "Pado")
}
