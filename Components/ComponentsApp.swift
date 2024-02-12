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
            RepresentableTextFieldView()
        }
    }
}
