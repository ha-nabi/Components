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
                // MARK: View Section
                Section {
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
                } header: {
                    Text("View")
                }
                
                // MARK: Animation Section
                Section {
                    NavigationLink {
                        ImageParalax()
                    } label: {
                        Text("ImageParalax")
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
                } header: {
                    Text("Animation")
                }

                // MARK: Component
                Section {
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
                        InstaGrid()
                    } label: {
                        Text("InstaGrid")
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
                } header: {
                    Text("Component")
                }
            }
            .listStyle(.grouped)
        }
    }
}

#Preview {
    ContentView()
}
