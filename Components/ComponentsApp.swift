//
//  ComponentsApp.swift
//  Components
//
//  Created by 강치우 on 11/5/23.
//

import SwiftUI

@main
struct ComponentsApp: App {
    
    @State var show = false
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if show {
                    SampleView()
                } else {
                    LunchSTA()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        show = true
                    }
                }
            }
        }
    }
}
