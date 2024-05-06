//
//  Post.swift
//  Components
//
//  Created by 강치우 on 5/7/24.
//

import Foundation

struct Post: Identifiable {
    let id: UUID = .init()
    var username: String
    var content: String
    var pics: [PicItem]
    var scrollPosition: UUID?
}

var samplePosts: [Post] = [
    .init(username: "Hanabi", content: "Nature Pics", pics: pics),
    .init(username: "Jenna", content: "Reversed Nature Pics", pics: pics1)
]

private var pics: [PicItem] = (1...5).compactMap { index -> PicItem? in
    return .init(image: "Pic \(index)")
}

private var pics1: [PicItem] = (1...5).reversed().compactMap { index -> PicItem? in
    return .init(image: "Pic \(index)")
}
