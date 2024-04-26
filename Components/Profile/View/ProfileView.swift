//
//  ProfileView.swift
//  Components
//
//  Created by 강치우 on 1/30/24.
//

import SwiftUI

struct ProfileView: View {
    @State var currentType: String = "게시글"
    @State var _albums: [Album] = albums
    @State var headerOffsets: (CGFloat, CGFloat) = (0, 0)
    @State var buttonOnOff: Bool = false
    
    let columns = [GridItem(.flexible(), spacing: 1), GridItem(.flexible(), spacing: 1), GridItem(.flexible())]
    
    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HeaderView()
            VStack(spacing: 0) {
                PinnedHeaderView()
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        PostList()
                    }
                }
            }
        }
        .background(.black)
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let size = proxy.size
            let height = (size.height + minY)
            
            Image("pp2")
                .resizable()
                .scaledToFill()
                .frame(width: size.width, height: height > 0 ? height : 0, alignment: .top)
                .cornerRadius(15)
                .overlay {
                    ZStack(alignment: .bottom) {
                        LinearGradient(colors: [.clear, .black.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Circle()
                                .frame(height: 70)
                                .overlay {
                                    Image("pp1")
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(70)
                                }
                            
                            HStack(alignment: .bottom, spacing: 10) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("강치우")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                    
                                    Text("@hanabi")
                                        .font(.title.bold())
                                        .foregroundStyle(.white)
                                }
                                
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundStyle(.blue)
                                    .background {
                                        Circle()
                                            .fill(.white)
                                            .padding(3)
                                    }
                                    .offset(y: -5)
                            }
                                                       
                            HStack {
                                Label {
                                    Text("파도")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white.opacity(0.7))
                                } icon: {
                                    Text("0")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                }
                                .font(.caption)
                                
                                Label {
                                    Text("팔로워")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white.opacity(0.7))
                                } icon: {
                                    Text("0")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                }
                                .font(.caption)
                                
                                Label {
                                    Text("팔로잉")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white.opacity(0.7))
                                } icon: {
                                    Text("0")
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                }
                                .font(.caption)
                            }
                            .padding(.leading, 2)
                            
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 25)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .cornerRadius(0)
                .offset(y: -minY)
        }
        .frame(height: 200)
    }
    
    @ViewBuilder
    func PinnedHeaderView() -> some View {
        let types: [String] = ["게시글", "좋아요", "하이라이트"]
        HStack(spacing: 25) {
            ForEach(types, id: \.self) { type in
                VStack(spacing: 12) {
                    Text(type)
                        .fontWeight(.semibold)
                        .foregroundStyle(currentType == type ? .white : .gray)
                    
                    ZStack {
                        if currentType == type {
                            RoundedRectangle(cornerRadius: 4, style: .continuous)
                                .fill(.white)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        } else {
                            RoundedRectangle(cornerRadius: 4, style: .continuous)
                                .fill(.clear)
                        }
                    }
                    .padding(.horizontal, 8)
                    .frame(height: 3)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        currentType = type
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
    
    @ViewBuilder
    func PostList() -> some View {
        switch currentType {
        case "게시글":
            PostView()
        case "좋아요":
            WrittenPostsView()
        case "하이라이트":
            HighlightsView()
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func PostView() -> some View {
        VStack(spacing: 25) {
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(1...10, id: \.self) { _ in
                    ZStack(alignment: .bottomLeading) {
                        Image("B12")
                            .resizable()
                    }
                    .frame(width: (UIScreen.main.bounds.width / 3) - 2, height: 160)
                }
            }
        }
        .padding(.bottom, 150)
        .padding(.top, 5)
    }
    
    @ViewBuilder
    func WrittenPostsView() -> some View {
        VStack(spacing: 25) {
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(1...1, id: \.self) { _ in
                    ZStack(alignment: .bottomLeading) {
                        Image("B11")
                            .resizable()
                    }
                    .frame(width: (UIScreen.main.bounds.width / 3) - 2, height: 160)
                }
            }
        }
        .padding(.bottom, 150)
    }
    
    @ViewBuilder
    func HighlightsView() -> some View {
        VStack(spacing: 25) {
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(1...5, id: \.self) { _ in
                    ZStack(alignment: .bottomLeading) {
                        Image("B14")
                            .resizable()
                    }
                    .frame(width: (UIScreen.main.bounds.width / 3) - 2, height: 160)
                }
            }
        }
        .padding(.bottom, 150)
    }
}

#Preview {
    ProfileView()
}
