//
//  CostomToasts.swift
//  Components
//
//  Created by 강치우 on 5/5/24.
//

import SwiftUI

struct CostomToasts: View {
    var body: some View {
        VStack {
            Button("Present Toast") {
                Toast.shared.present(
                    title: "AirPods Pro",
                    symbol: "airpodspro",
                    isUserInteractionEnabled: true,
                    timing: .long
                )
            }
            .padding()
            
            Text("프리뷰에서 확인해주세요")
        }
        .padding()
        .navigationTitle("CostomToasts")
        .toolbarTitleDisplayMode(.inline)
    }
}

#Preview {
    RootView {
        CostomToasts()
    }
}
