//
//  ContentView.swift
//  SwiftUI_Study
//
//  Created by 강치우 on 11/4/23.
//

import SwiftUI

struct SliderView: View {
    //@State는 상위 뷰에 선언하고 하위뷰에서 @Binding, State에 디폴트 값을 설정
    @State var selectedTitle = "Main"
    @State var showSide = false
    //Sliding을 위한 변수
    @State var translation: CGSize = .zero
    @State var offsetX: CGFloat = -120
    
    //TabView를 사용하면(스크롤 미사용시) 보이지 않는 페이지버튼이 하단에 TabBar로 생성된다. 이것을 제거하는 초기화 코드
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        HStack {
            SideView(selectedTitle: $selectedTitle)
            ZStack {
                HomeView(selectedTitle: $selectedTitle)
            }
            //사이드메뉴 버튼
            .overlay(alignment: .topLeading, content: {
                VStack {
                    Button(action: {
                        withAnimation(.spring()){
                            showSide.toggle()
                        }
                    }) {
                        VStack(spacing: 5) {
                            Capsule()
                                .fill(Color.primary)
                                .frame(width: 30, height: 3)
                                .rotationEffect(.degrees(showSide ? 45 : 0))
                                .offset(y: showSide ? 8 : 0)
                            Capsule()
                                .fill(Color.primary)
                                .frame(width: 30, height: 3)
                                .opacity(showSide ? 0 : 1)
                            Capsule()
                                .fill(Color.primary)
                                .frame(width: 30, height: 3)
                                .rotationEffect(.degrees(showSide ? -45 : 0))
                                .offset(y: showSide ? -8 : 0)
                        }
                        .padding()
                    }//Button
                }
            })//overlay
        }
        //홈과 사이드 메뉴가 움직이도록 하는 오프셋
        .offset(x: (translation.width + offsetX) > -120 ? ((translation.width + offsetX) < 120 ? translation.width + offsetX : 120 ) : -120)
        //사이드메뉴 버튼으로 showSide값에 변화가 있을 때, 사이드 메뉴 열기
        .onChange(of: showSide) { _, _ in
            withAnimation(.spring()) {
                if showSide && offsetX == -120 {
                    offsetX = 120
//                    print("showSide ON")
                }
                if !showSide && offsetX == 120 {
                    offsetX = -120
//                    print("showSide OFF")
                }
            }
        }
        //드래그로 사이드 메뉴 열기
        .gesture(
            DragGesture()
                .onChanged { value in
                    translation = value.translation
                }
                .onEnded {_ in
                    withAnimation(.spring()) {
                        let dragOffset = translation.width + offsetX

                        if dragOffset > -100 && offsetX == -120 {
                            offsetX = 120
                            showSide = true
                        } else if dragOffset < 100 && offsetX == 120 {
                            offsetX = -120
                            showSide = false
                        }
                        translation = .zero
                    }
                }
        )
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}


