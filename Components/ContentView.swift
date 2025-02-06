//
//  ContentView.swift
//  Components
//
//  Created by 강치우 on 4/26/24.
//

import SwiftUI

public struct ContentView: View {
    public var body: some View {
        NavigationStack {
            List {
                // MARK: View Section
                Section {
                    NavigationLink {
                        MapsBottomSheet()
                    } label: {
                        Text("MapsBottomSheet")
                    }

                    NavigationLink {
                        DefaultSettingView()
                    } label: {
                        Text("DefaultSettingView")
                    }

                    NavigationLink {
                        ProfileView()
                    } label: {
                        Text("CustomProfile")
                    }
                    
                    NavigationLink {
                        ImageViewer()
                    } label: {
                        Text("ImageViewer")
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
                        AutoScrollingTab()
                    } label: {
                        Text("AutoScrollingTab")
                    }
                } header: {
                    Text("View")
                }
                
                // MARK: Animation Section
                Section {
                    NavigationLink {
                        AppStoreView()
                    } label: {
                        Text("AppStoreView")
                    }

                    NavigationLink {
                        ZoomTransition()
                    } label: {
                        Text("ZoomTransition")
                    }
                    
                    NavigationLink {
                        AnimatedPageIndicator()
                    } label: {
                        Text("AnimatedPageIndicator")
                    }
                    
                    NavigationLink {
                        AnimatedSegmentedControl()
                    } label: {
                        Text("AnimatedSegmentedControl")
                    }
                    
                    NavigationLink {
                        BoomerangCards()
                    } label: {
                        Text("BoomerangCards")
                    }
                    
                    NavigationLink {
                        AnimatedCharts()
                    } label: {
                        Text("AnimatedCharts")
                    }
                    
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

                // MARK: Component Section
                Section {
                    NavigationLink {
                        CostomToasts()
                    } label: {
                        Text("CustomToasts")
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
            .navigationTitle("Component")
        }
    }
}
