//
//  ZoomTransition.swift
//  Components
//
//  Created by 강치우 on 9/17/24.
//

import SwiftUI

struct ZoomTransition: View {
    @Namespace private var animation
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 3)) {
                    ForEach(sampleItems) { item in
                        NavigationLink(value: item) {
                            if #available(iOS 18.0, *) {
                                GeometryReader {
                                    let size = $0.size
                                    
                                    if let image = item.image {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: size.width, height: size.height)
                                            .clipShape(.rect(cornerRadius: 12))
                                    }
                                }
                                .frame(height: 150)
                                .matchedTransitionSource(id: item.id, in: animation) { config in
                                    config
                                        .background(.clear)
                                        .clipShape(.rect(cornerRadius: 12))
                                }
                            }
                        }
                        .contentShape(.rect(cornerRadius: 12))
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("프리뷰에서 확인")
            .navigationDestination(for: Item.self) { item in
                if #available(iOS 18.0, *) {
                    GeometryReader {
                        let size = $0.size
                        
                        if let image = item.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: size.width, height: size.height)
                                .clipShape(.rect(cornerRadius: 12))
                        }
                    }
                    .padding()
                    .navigationTitle(item.title)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTransition(.zoom(sourceID: item.id, in: animation))
                }
            }
        }
    }
}

struct Item: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var image: UIImage?
}

var sampleItems: [Item] = [
    .init(title: "image1", image: UIImage(named: "B1")),
    .init(title: "image2", image: UIImage(named: "B2")),
    .init(title: "image3", image: UIImage(named: "B3")),
    .init(title: "image4", image: UIImage(named: "B4")),
    .init(title: "image5", image: UIImage(named: "B5")),
    .init(title: "image6", image: UIImage(named: "B6"))
]

#Preview {
    ZoomTransition()
}
