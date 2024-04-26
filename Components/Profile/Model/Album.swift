//
//  Album.swift
//  Components
//
//  Created by 강치우 on 1/30/24.
//

import SwiftUI

struct Album: Identifiable {
    var id = UUID().uuidString
    var albumName: String
    var albumImage: String
    var isLiked: Bool = false
}

var albums: [Album] = [
    Album(albumName: "pp1", albumImage: "pp1"),
    Album(albumName: "pp1", albumImage: "pp1"),
    Album(albumName: "pp1", albumImage: "pp1"),
    Album(albumName: "pp1", albumImage: "pp1"),
    Album(albumName: "pp1", albumImage: "pp1"),
    Album(albumName: "pp1", albumImage: "pp1"),
    Album(albumName: "pp1", albumImage: "pp1"),
    Album(albumName: "pp1", albumImage: "pp1"),
    Album(albumName: "pp1", albumImage: "pp1")
]
