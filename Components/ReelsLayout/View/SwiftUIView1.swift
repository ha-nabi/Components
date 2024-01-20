//
//  SwiftUIView1.swift
//  Components
//
//  Created by 강치우 on 1/18/24.
//

import SwiftUI

struct SwiftUIView1: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ContentView3()
                .tabItem {
                    Image(selectedTab == 0 ? "Home_light" : "Home_gray")
                        .resizable()
                        .scaledToFit()
                        
                    Text("홈")
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            Text("검색")
                .tabItem {
                    Image(selectedTab == 1 ? "Search_light" : "Search_gray")
                        .scaledToFit()
                    Text("검색")
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            Text("서핑")
                .tabItem {
                    Image(selectedTab == 2 ? "Add_square_light" : "Add_square_gray")
                        .scaledToFit()
                    Text("서핑")
                }
                .onAppear { selectedTab = 2 }
                .tag(2)
            Text("오늘 파도")
                .tabItem {
                    Image(selectedTab == 3 ? "Remove_light" : "Remove_gray")
                        .scaledToFit()
                    Text("오늘 파도")
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            Text("프로필")
                .tabItem {
                    Image(selectedTab == 4 ? "User_light" : "User_gray")
                        .scaledToFit()
                    Text("프로필")
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
                .badge(10)
            
        }
        .tint(.white)
    }
}

#Preview {
    SwiftUIView1()
}
