//
//  ImageViewer.swift
//  Components
//
//  Created by 강치우 on 5/7/24.
//

import SwiftUI

struct ImageViewer: View {
    @State private var posts: [Post] = samplePosts
    @State private var showDetailView: Bool = false
    @State private var detailViewAnimation: Bool = false
    @State private var selectedPicID: UUID?
    @State private var selectedPost: Post?
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 15) {
                    ForEach(posts) { post in
                        CardView(post)
                    }
                }
                .safeAreaPadding(15)
            }
            .navigationTitle("Animation")
        }
        .overlay {
            if let selectedPost, showDetailView {
                DetailsView(
                    showDetailView: $showDetailView,
                    detailViewAnimation: $detailViewAnimation,
                    selectedPicID: $selectedPicID,
                    post: selectedPost
                ) { id in
                    /// 스크롤 포지션 업데이트
                    if let index = posts.firstIndex(where: { $0.id == selectedPost.id }) {
                        posts[index].scrollPosition = id
                    }
                }
                .transition(.offset(y: 5))
            }
        }
        .overlayPreferenceValue(OffsetKey1.self, { value in
            GeometryReader { proxy in
                if let selectedPicID, let source = value[selectedPicID.uuidString], let destination = value["DESTINATION\(selectedPicID.uuidString)"], let picItem = selectedImage(), showDetailView {
                    let sRect = proxy[source]
                    let dRect = proxy[destination]
                    
                    Image(picItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: detailViewAnimation ? dRect.width : sRect.width, height: detailViewAnimation ? dRect.height : sRect.height)
                        .clipShape(.rect(cornerRadius: detailViewAnimation ? 0 : 10))
                        .offset(x: detailViewAnimation ? dRect.minX : sRect.minX, y: detailViewAnimation ? dRect.minY : sRect.minY)
                        .allowsHitTesting(false)
                }
            }
        })
    }
    
    func selectedImage() -> PicItem? {
        if let pic = selectedPost?.pics.first(where: { $0.id == selectedPicID }) {
            return pic
        }
        
        return nil
    }
    
    /// Card View
    @ViewBuilder
    func CardView(_ post: Post) -> some View {
        VStack(spacing: 10) {
            HStack(spacing: 15) {
                Image(systemName: "person.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.teal)
                    .frame(width: 30, height: 30)
                    .background(.background)
                
                VStack(alignment: .leading, spacing: 4, content: {
                    Text(post.username)
                        .fontWeight(.semibold)
                        .textScale(.secondary)
                    
                    Text(post.content)
                })
                
                Spacer(minLength: 0)
                
                Button("", systemImage: "ellipsis") {
                    
                }
                .foregroundStyle(.primary)
                .offset(y: -10)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                ///스크롤 뷰를 사용한 Image Carousel iOS 17 이상에서만 사용가능
                GeometryReader {
                    let size = $0.size
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(post.pics) { pic in
                                LazyHStack {
                                    Image(pic.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(maxWidth: size.width)
                                        .clipShape(.rect(cornerRadius: 10))
                                }
                                .frame(maxWidth: size.width)
                                .frame(height: size.height)
                                .anchorPreference(key: OffsetKey1.self, value: .bounds, transform: { anchor in
                                    return [pic.id.uuidString: anchor]
                                })
                                .onTapGesture {
                                    selectedPost = post
                                    selectedPicID = pic.id
                                    showDetailView = true
                                }
                                .contentShape(.rect)
                                .opacity(selectedPicID == pic.id ? 0 : 1)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollPosition(id: .init(get: {
                        return post.scrollPosition
                    }, set: { _ in
                        
                    }))
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                    .scrollClipDisabled()
                }
                .frame(height: 200)
                
                HStack(spacing: 10) {
                    ImageButton("suit.heart") {
                        
                    }
                    
                    ImageButton("message") {
                        
                    }
                    
                    ImageButton("arrow.2.squarepath") {
                        
                    }
                    
                    ImageButton("paperplane") {
                        
                    }
                }
            }
            .safeAreaPadding(.leading, 45)
            
            /// Likes & Replies
            HStack(spacing: 15) {
                Image(systemName: "person.circle.fill")
                    .frame(width: 30, height: 30)
                    .background(.background)
                
                Button("10 replies") {
                    
                }
                
                Button("810 likes") {
                    
                }
                .padding(.leading, -5)
                
                Spacer()
            }
            .textScale(.secondary)
            .foregroundStyle(.secondary)
        }
        .background(alignment: .leading) {
            Rectangle()
                .fill(.secondary)
                .frame(width: 1)
                .padding(.bottom, 30)
                .offset(x: 15, y: 10)
        }
    }
    
    @ViewBuilder
    func ImageButton(_ icon: String, onTap: @escaping () -> ()) -> some View {
        Button("", systemImage: icon, action: onTap)
            .font(.title3)
            .foregroundStyle(.primary)
    }
}

#Preview {
    ImageViewer()
}
