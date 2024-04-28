//
//  Reel.swift
//  Components
//
//  Created by 강치우 on 11/16/23.
//

import SwiftUI
// Reel Model & Sample Video Files
struct Reel: Identifiable {
    var id: UUID = .init()
    var videoID: String
    var authorName: String
    var isLiked: Bool = false
}

var reelsData: [Reel] = [
    .init(videoID: "Reel 1", authorName: "Reel 1"),
    .init(videoID: "Reel 2", authorName: "Reel 2"),
    .init(videoID: "Reel 3", authorName: "Reel 3"),
    .init(videoID: "Reel 4", authorName: "Reel 4"),
    .init(videoID: "Reel 5", authorName: "Reel 5"),
    .init(videoID: "Reel 6", authorName: "")
]
