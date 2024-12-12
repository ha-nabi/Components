//
//  MapsBottomSheet.swift
//  Components
//
//  Created by 강치우 on 12/12/24
//  Copyright © 2022 Vlip (xperiventure). All rights reserved.
//

import SwiftUI
import MapKit

struct MapsBottomSheet: View {
    /// View Properties
    @State private var showSheet: Bool = false
    @State private var activeTab: BottomSheetTab = .devices
    @State private var ignoreTabBar: Bool = false
    var body: some View {
        ZStack(alignment: .bottom) {
            /// This Project Supports iOS 16
            Group {
                if #available(iOS 17, *) {
                    Map(initialPosition: .region(.applePark))
                } else {
                    Map(coordinateRegion: .constant(.applePark))
                }
            }
            .safeAreaInset(edge: .bottom) {
                /// For the Visible of Apple Maps and Legal Link.
                Rectangle()
                    .fill(.clear)
                    .frame(height: 49 + 60)
            }
        }
        .task {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            ScrollView(.vertical, content: {
                VStack(alignment: .leading, spacing: 15, content: {
                    Text(activeTab.rawValue)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Toggle("Ignore Tab Bar", isOn: $ignoreTabBar)
                })
                .padding()
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .presentationDetents([.height(60), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            .interactiveDismissDisabled()
            /// Add it inside Sheet View
        }
    }
    
    /// Tab Bar
    @ViewBuilder
    func TabBar() -> some View {
        HStack(spacing: 0) {
            ForEach(BottomSheetTab.allCases, id: \.rawValue) { tab in
                Button(action: { activeTab = tab }, label: {
                    VStack(spacing: 2) {
                        Image(systemName: tab.symbol)
                            .font(.title3)
                        
                        Text(tab.rawValue)
                            .font(.caption2)
                    }
                    .foregroundStyle(activeTab == tab ? Color.accentColor : .gray)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(.rect)
                })
                .buttonStyle(.plain)
            }
        }
        .overlay(alignment: .top) {
            Divider()
        }
    }
}

#Preview {
    MapsBottomSheet()
}

extension MKCoordinateRegion {
    /// Apple Mark Region
    static var applePark: MKCoordinateRegion {
        let center = CLLocationCoordinate2D(latitude: 37.334606, longitude: -122.009102)
        return .init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}
