//
//  CardView.swift
//  Components
//
//  Created by 강치우 on 12/11/23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ForEach(0..<5) { item in
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .shadow(color: .black.opacity(0.2), radius: 10, x:0, y: 10)
                .padding()
                .overlay {
                    VStack(alignment: .leading) {
                        Circle()
                            .frame(width: 50, height: 50)
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .frame(width: 100, height: 25)
                        VStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .frame(width: 250, height: 15)
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .frame(width: 200, height: 15)
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .frame(width: 290, height: 15)
                        }
                        .padding(.top)
                    }
                }
        }
    }
}

#Preview {
    CardView()
}
