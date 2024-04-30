//
//  AutoScrollingTab.swift
//  Components
//
//  Created by 강치우 on 4/30/24.
//

import SwiftUI

struct AutoScrollingTab: View {
    @State private var activeTab: Tab = .men
    @State private var scrollProgress: CGFloat = .zero
    @State private var tapState: AnimationState = .init()
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                TabView(selection: $activeTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        TabImageView(tab)
                            .tag(tab)
                            .offsetX(activeTab == tab) { rect in
                                let minX = rect.minX
                                let pageOffset = minX - (size.width * CGFloat(tab.index))
                                let pageProgress = pageOffset / size.width
                                if !tapState.status {
                                    scrollProgress = max(min(pageProgress, 0), -CGFloat(Tab.allCases.count - 1))
                                }
                            }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            .preferredColorScheme(.dark)
            .overlay(alignment: .top, content: {
                TabIndicatorView()
            })
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }
    
    /// Tab Indicator View
    @ViewBuilder
    func TabIndicatorView() -> some View {
        GeometryReader {
            let size = $0.size
            /// 화면에 보여줄 탭 갯수
            let tabWidth = size.width / 3
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Text(tab.rawValue)
                        .font(.title3.bold())
                        .foregroundColor(activeTab == tab ? .primary : .gray)
                        .frame(width: tabWidth)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                activeTab = tab
                                /// Setting Scroll Progress Explicitly
                                scrollProgress = -CGFloat(tab.index)
                                tapState.startAnimation()
                            }
                        }
                }
            }
            .modifier(
                AnimationEndCallback(endValue: tapState.progress, onEnd: {
                    tapState.reset()
                })
            )
            .frame(width: CGFloat(Tab.allCases.count) * tabWidth)
            /// 시작할 위치
            .padding(.leading, tabWidth)
            .offset(x: scrollProgress * tabWidth)
        }
        .frame(height: 40)
        .padding(.top, 15)
        .background {
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
        }
    }
    
    /// Image View
    @ViewBuilder
    func TabImageView(_ tab: Tab) -> some View {
        GeometryReader {
            let size = $0.size
            
            Image(tab.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipped()
        }
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

#Preview {
    AutoScrollingTab()
}
