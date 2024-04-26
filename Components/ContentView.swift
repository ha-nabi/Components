//
//  ContentView.swift
//  Components
//
//  Created by 강치우 on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    ProfileView()
                } label: {
                    Text("CustomProfile")
                }

                NavigationLink {
                    LoginKit()
                } label: {
                    Text("LoginKit")
                }

                NavigationLink {
                    SliderView()
                } label: {
                    Text("SliderView")
                }
                
                NavigationLink {
                    CardScroll()
                } label: {
                    Text("CardScroll")
                }
                
                NavigationLink {
                    ReelsLayout()
                } label: {
                    Text("ReelsLayout")
                }
                
                NavigationLink {
                    CustomNavBar()
                } label: {
                    Text("CustomNavBar")
                }
                
                NavigationLink {
                    ButtonView()
                } label: {
                    Text("DarkLightMode")
                }
                
                NavigationLink {
                    ThemeView()
                } label: {
                    Text("ThemeChanger")
                }
                
                NavigationLink {
                    Badge()
                } label: {
                    Text("Badge")
                }
                
                NavigationLink {
                    Glassmorphism()
                } label: {
                    Text("Glassmorphism")
                }
                
                NavigationLink {
                    Clock()
                } label: {
                    Text("RealTimeClock")
                }
                
                NavigationLink {
                    TextEffect(text: "chunrangsung")
                } label: {
                    Text("TextEffect")
                }
                
                NavigationLink {
                    StarShowerView()
                } label: {
                    Text("StarShower")
                }
                
                NavigationLink {
                    LunchSTA()
                } label: {
                    Text("LunchSTA")
                }
                
                NavigationLink {
                    InstaGrid()
                } label: {
                    Text("InstaGrid")
                }
                
                NavigationLink {
                    ImageParalax()
                } label: {
                    Text("ImageParalax")
                }
                
                NavigationLink {
                    CustomTab()
                } label: {
                    Text("CustomTabbar")
                }
                
                NavigationLink {
                    RepresentableTextFieldView()
                } label: {
                    Text("RepresentableTextField")
                }
                
                NavigationLink {
                    Point()
                } label: {
                    Text("LongPressButton")
                }
            }
            .navigationTitle("Component")
            .toolbarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
