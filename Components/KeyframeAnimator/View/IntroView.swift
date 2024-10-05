//
//  IntroView.swift
//  Components
//
//  Created by 강치우 on 10/6/24.
//

import SwiftUI

struct IntroView: View {
    @State private var activePage: Page = .page1
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack {
                Spacer(minLength: 0)
                
                MorphingSymbolView(
                    symbol: activePage.rawValue,
                    config: .init(
                        font: .system(size: 150, weight: .bold),
                        frame: .init(width: 250, height: 200),
                        radius: 30,
                        foregroundColor: .white,
                        keyFrameDuration: 0.4,
                        symbolAnimation: .smooth(duration: 0.5, extraBounce: 0)
                    )
                )
                
                TextContents(size: size)
                
                Spacer(minLength: 0)
                
                IndicatorView()
                
                ContinueButton()
            }
            .frame(maxWidth: .infinity)
            .overlay(alignment: .top) {
                HeaderView()
            }
        }
        .background {
            Rectangle()
                .fill(.black.gradient)
                .ignoresSafeArea()
        }
        .environment(\.colorScheme, .dark)
    }
    
    @ViewBuilder
    func TextContents(size: CGSize) -> some View {
        VStack(spacing: 8) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(Page.allCases, id: \.rawValue) { page in
                    Text(page.title)
                        .lineLimit(1)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .kerning(1.1)
                        .frame(width: size.width)
                }
            }
            /// Sliding Left/Right based on the active Page
            .offset(x: -activePage.index * size.width)
            .animation(.bouncy(duration: 0.7, extraBounce: 0.0), value: activePage)
            
            HStack(alignment: .top, spacing: 0) {
                ForEach(Page.allCases, id: \.rawValue) { page in
                    Text(page.subTitle)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)
                        .frame(width: size.width)
                }
            }
            /// Sliding Left/Right based on the active Page
            .offset(x: -activePage.index * size.width)
            /// Adding a little delay
            .animation(.bouncy(duration: 0.9, extraBounce: 0.0), value: activePage)
        }
        .padding(.top, 15)
        .frame(width: size.width, alignment: .leading)
    }
    
    @ViewBuilder
    func IndicatorView() -> some View {
        HStack(spacing: 6) {
            ForEach(Page.allCases, id: \.rawValue) { page in
                Capsule()
                    .fill(.white.opacity(activePage == page ? 1 : 0.4))
                    .frame(width: activePage == page ? 25 : 8, height: 8)
            }
        }
        .animation(.smooth(duration: 0.5, extraBounce: 0), value: activePage)
        .padding(.bottom, 12)
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack {
            Button {
                activePage = activePage.previousPage
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .contentShape(.rect)
            }
            .opacity(activePage != .page1 ? 1 : 0)
            
            Spacer(minLength: 0)
            
            Button("Skip") {
                activePage = .page4
            }
            .fontWeight(.semibold)
            .opacity(activePage != .page4 ? 1 : 0)
        }
        .foregroundStyle(.white)
        .animation(.snappy(duration: 0.35, extraBounce: 0), value: activePage)
        .padding(15)
    }
    
    @ViewBuilder
    func ContinueButton() -> some View {
        VStack(spacing: 10) {
            Button {
                activePage = activePage.nextPage
            } label: {
                Text(activePage == .page4 ? "Github로 로그인" : "다음으로")
                    .contentTransition(.identity)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                    .padding(.vertical, 15)
                    .frame(maxWidth: activePage == .page4 ? 260 : 180)
                    .background(.white, in: .rect(cornerRadius: 12))
            }
            .animation(.smooth(duration: 0.5, extraBounce: 0), value: activePage)
        }
    }
}

#Preview {
    IntroView()
}

