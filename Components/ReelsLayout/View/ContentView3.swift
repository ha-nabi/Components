//
//  ContentView3.swift
//  Components
//
//  Created by 강치우 on 11/16/23.
//

import SwiftUI

struct ContentView3: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            
            Main(size: size, safeArea: safeArea)
                .ignoresSafeArea(.container, edges: .all)
        }
    }
}

#Preview {
    ContentView3()
}
