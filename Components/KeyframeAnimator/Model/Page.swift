//
//  Page.swift
//  Components
//
//  Created by 강치우 on 10/6/24.
//

import SwiftUI

enum Page: String, CaseIterable {
    case page1 = "trophy.fill"
    case page2 = "gamecontroller.fill"
    case page3 = "link.icloud.fill"
    case page4 = "text.bubble.fill"
    
    var title: String {
        switch self {
        case .page1: "깃허브 점수가 궁금하지 않으신가요?"
        case .page2: "커밋 챌린지에 도전하기"
        case .page3: "간편하게 기록을 확인하기"
        case .page4: "시작하기"
        }
    }
    
    var subTitle: String {
        switch self {
        case .page1: "깃허브 활동을 분석하여 나만의 점수를 제공합니다."
        case .page2: "꾸준한 커밋으로\n깃허브 커밋 챌린지를 완수하세요."
        case .page3: "오늘, 이번 주, 그리고\n연속 커밋 기록을 제공합니다."
        case .page4: "로그인하여 더 많은 기능을 이용하세요."
        }
    }
    
    var index: CGFloat {
        switch self {
        case .page1: 0
        case .page2: 1
        case .page3: 2
        case .page4: 3
        }
    }
    
    /// Fetches the next page, if it's not the last page
    var nextPage: Page {
        let index = Int(self.index) + 1
        if index < 4 {
            return Page.allCases[index]
        }
        
        return self
    }
    
    /// Fetches the previous page, if it's not the first page
    var previousPage: Page {
        let index = Int(self.index) - 1
        if index >= 0 {
            return Page.allCases[index]
        }
        
        return self
    }
}
