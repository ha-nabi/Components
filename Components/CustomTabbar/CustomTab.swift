//
//  CustomTab.swift
//  Components
//
//  Created by 강치우 on 1/20/24.
//

import SwiftUI

struct CustomTab: View {
    @State var show = 0
    @State var title = ["홈", "검색", "서핑", "오늘 파도", "프로필"]
    @State var image = ["tab_home", "tab_search", "tab_todaypado", "tab_todaypado", "tab_profile"]
    
    var body: some View {
        ZStack {
            Color.tabView.ignoresSafeArea()
            
            switch show {
            case 0:
                Text("홈")
                    .foregroundStyle(.white)
            case 1:
                Text("검색")
                    .foregroundStyle(.white)
            case 2:
                Text("서핑")
                    .foregroundStyle(.white)
            case 3:
                Text("오늘 파도")
                    .foregroundStyle(.white)
            case 4:
                Text("프로필")
                    .foregroundStyle(.white)
            default:
                Text("")
            }
            
            VStack {
                Spacer()
                
                Divider()
                
                HStack {
                    ForEach(0..<5, id: \.self) { option in
                        Spacer()
                        
                        Button {
                            show = option
                        } label: {
                            if option == 2 {
                                VStack {
                                    Image("tab_add")
                                }
                            } else {
                                VStack {
                                    Image(image[option])
                                    
                                    Text(title[option])
                                        .foregroundStyle(.white)
                                        .font(.system(size: 12))
                                        .fontWeight(.semibold)
                                }
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    CustomTab()
}
