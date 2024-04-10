//
//  SwiftUIView1.swift
//  Components
//
//  Created by 강치우 on 1/18/24.
//

import SwiftUI

struct SwiftUIView1: View {
    @State private var selectedTab = 0
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                ContentView3()
                    .tabItem {
                        Image(selectedTab == 0 ? "tab_home" : "tab_home_gray")
                            
                        Text("홈")
                    }
                    .onAppear { selectedTab = 0 }
                    .tag(0)
                
                Text("검색")
                    .tabItem {
                        Image(selectedTab == 1 ? "tab_search" : "tab_search_gray")
                        
                        Text("검색")
                    }
                    .onAppear { selectedTab = 1 }
                    .tag(1)
                
                Text("서핑")
                    .tabItem {
                        Text("")
                        
                        Image("tab_add")
                    }
                    .onAppear { selectedTab = 2 }
                    .tag(2)
                
                Text("오늘 파도")
                    .tabItem {
                        Image(selectedTab == 3 ? "tab_todaypado" : "tab_todaypado_gray")
                        
                        Text("오늘 파도")
                    }
                    .onAppear { selectedTab = 3 }
                    .tag(3)
                
                SpotifyView()
                    .tabItem {
                        Image(selectedTab == 4 ? "tab_profile" : "tab_profile_gray")
                        
                        Text("프로필")
                    }
                    .onAppear { selectedTab = 4 }
                    .tag(4)
                    .badge(10)
                
            }
            .tint(.white)
        }
        .frame(height: UIScreen.main.bounds.height) // 직접적으로 탭바의 높이를 설정함
    }
}

#Preview {
    SwiftUIView1()
}
