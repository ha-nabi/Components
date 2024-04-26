//
//  InstaGrid.swift
//  Components
//
//  Created by 강치우 on 1/8/24.
//

import SwiftUI

struct InstaGrid: View {
    let imgStrings = [
        "B1","B2","B3","B4","B5","B6","B7","B8","B9","B10","B11","B12","B13","B14","B15","B16","B17","B18","B19","B20"
    ]
    
    var body: some View {
        Exploregrid(imgStrings: imgStrings, spacing: 2)
    }
}

#Preview {
    InstaGrid()
}
