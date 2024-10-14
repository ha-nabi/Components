//
//  TodayItem.swift
//  Components
//
//  Created by 강치우 on 10/14/24
//  Copyright © 2022 Vlip (xperiventure). All rights reserved.
//

import SwiftUI

// MARK: 데이터 모델 및 샘플 데이터
struct TodayItem: Identifiable {
    var id = UUID().uuidString
    var appName: String
    var description: String
    var logoImageName: String
    var bannerTitle: String
    var platform: String
    var artworkImageName: String
}

var sampleTodayItems: [TodayItem] = [
    TodayItem(
        appName: "LEGO Brawls",
        description: "친구들과 온라인에서 배틀하세요",
        logoImageName: "Logo1",
        bannerTitle: "LEGO Brawls에서 라이벌을 무찌르세요",
        platform: "Apple Arcade",
        artworkImageName: "Post1"
    ),
    TodayItem(
        appName: "Forza Horizon",
        description: "레이싱 게임",
        logoImageName: "Logo2",
        bannerTitle: "호라이즌 페스티벌을 이끄세요",
        platform: "Apple Arcade",
        artworkImageName: "Post2"
    )
]

var sampleText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
