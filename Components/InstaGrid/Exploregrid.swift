//
//  Exploregrid.swift
//  Components
//
//  Created by 강치우 on 1/8/24.
//

import SwiftUI

struct Exploregrid: View {
    
    let layoutImgStrings: [[String]]
    var spacing: CGFloat
    
    init(imgStrings: [String], spacing: CGFloat = 2) {
        
        var layoutimgStrings = [[String]]()
        var tmp = [String]()
        
        for img in imgStrings {
            tmp.append(img)
            
            if tmp.count >= 3 {
                layoutimgStrings.append(tmp)
                tmp.removeAll()
            }
        }
        
        if !tmp.isEmpty {
            layoutimgStrings.append(tmp)
        }
        
        self.layoutImgStrings = layoutimgStrings
        self.spacing = spacing
    }
    
    
    var body: some View {
        GeometryReader { reader in
            ScrollView(showsIndicators: false) {
                VStack(spacing: spacing) {
                    
                    let viewWidth: CGFloat = reader.size.width
                    
                    ForEach(layoutImgStrings.indices) { i in
                        
                        let imgStrings = layoutImgStrings[i]
                        
                        if i % 3 != 2 || imgStrings.count < 3 {
                            layout1(imgStrings: imgStrings, viewWidth: viewWidth, spacing: spacing)
                        } else {
                            if i % 2 == 0 {
                                layout2(imgStrings: imgStrings, viewWidth: viewWidth, spacing: spacing)
                            } else {
                                layout3(imgStrings: imgStrings, viewWidth: viewWidth, spacing: spacing)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct layout1: View {
    
    let imgStrings: [String]
    let viewWidth: CGFloat
    let spacing: CGFloat
    
    var body: some View {
        
        let height:CGFloat = (viewWidth - (2 * spacing)) / 3
        
        return HStack(spacing: spacing) {
            ForEach(imgStrings, id: \.self){ imgStrings in
                Image(imgStrings)
                    .resizable()
                    .frame(width: height, height: height)
                    .scaledToFill()
            }
        }
        .frame(width: viewWidth, height: height, alignment: .leading)
    }
}

struct layout2: View {
    
    let imgStrings: [String]
    let viewWidth: CGFloat
    let spacing: CGFloat
    
    var body: some View {
        
        let smallItemWidth: CGFloat = (viewWidth - (3 * spacing)) / 3
        let height: CGFloat = smallItemWidth * 2 + spacing
        
        return HStack(spacing: spacing) {
            VStack(spacing: spacing) {
                Image(imgStrings[0])
                    .resizable()
                    .frame(width: smallItemWidth, height: smallItemWidth)
                    .scaledToFill()
                
                Image(imgStrings[1])
                    .resizable()
                    .frame(width: smallItemWidth, height: smallItemWidth)
                    .scaledToFill()
            }
            Image(imgStrings[2])
                .resizable()
                .frame(width: height, height: height)
                .scaledToFill()
        }
        .frame(height: height)
    }
}

struct layout3: View {
    
    let imgStrings: [String]
    let viewWidth: CGFloat
    let spacing: CGFloat
    
    var body: some View {
        
        let smallItemWidth: CGFloat = (viewWidth - (3 * spacing)) / 3
        let height: CGFloat = smallItemWidth * 2 + spacing
        
        return HStack(spacing: spacing) {
            Image(imgStrings[0])
                .resizable()
                .frame(width: height, height: height)
                .scaledToFill()
            
            VStack(spacing: spacing) {
                
                Image(imgStrings[1])
                    .resizable()
                    .frame(width: smallItemWidth, height: smallItemWidth)
                    .scaledToFill()
                
                Image(imgStrings[2])
                    .resizable()
                    .frame(width: smallItemWidth, height: smallItemWidth)
                    .scaledToFill()
            }
        }
        .frame(height: height)
    }
}

#Preview {
    InstaGrid()
}
