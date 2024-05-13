//
//  BoomerangCards.swift
//  Components
//
//  Created by 강치우 on 5/14/24.
//

import SwiftUI

struct BoomerangCards: View {
    @State var cards: [BoomerangCardsModel] = []
    @State var isBlurEnabled: Bool = false
    @State var isRotationEnabled: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            Toggle("Enable Blur", isOn: $isBlurEnabled)
            Toggle("Turn On Rotation", isOn: $isRotationEnabled)
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
            
            BoomerangCard(isRotationEnabled: isRotationEnabled, isBlurEnabled: isBlurEnabled, cards: $cards)
                .frame(height: 220)
                .padding(.horizontal,15)
        }
        .padding(15)
        .background {
            Color("BG")
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
        .onAppear(perform: setupCards)
    }
    
    // MARK: Setting Up Card's
    func setupCards() {
        for index in 1...8 {
            cards.append(.init(imageName: "Card \(index)"))
        }
        
        if var first = cards.first {
            first.id = UUID().uuidString
            cards.append(first)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        BoomerangCards()
    }
}

// MARK: Boomerang Card View
struct BoomerangCard: View {
    var isRotationEnabled: Bool = false
    var isBlurEnabled: Bool = false
    @Binding var cards: [BoomerangCardsModel]
    
    @State var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            ZStack {
                ForEach(cards.reversed()) { card in
                    let index = indexOf(card: card)
                    
                    CardView(card: card, size: size)
                        .scaleEffect(card.scale,anchor: card.isRotated ? .center : .top)
                        .rotation3DEffect(.init(degrees: isRotationEnabled && card.isRotated ? 360 : 0), axis: (x: 0, y: 0, z: 1))
                        .offset(y: -offsetFor(index: index))
                        .offset(y: card.extraOffset)
                        .scaleEffect(scaleFor(index: index), anchor: .top)
                        .zIndex(card.zIndex)
                         // MARK: Moving Only Current Active Card
                        .offset(y: currentIndex == indexOf(card: card) ? offset : 0)
                }
            }
            .animation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: offset == .zero)
            .frame(width: size.width, height: size.height)
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 2)
                    .onChanged(onChanged(value:))
                    .onEnded(onEnded(value:))
            )
        }
    }
    
    @ViewBuilder
    func CardView(card: BoomerangCardsModel,size: CGSize) -> some View {
        Image(card.imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size.width, height: size.height)
            .blur(radius: card.isRotated && isBlurEnabled ? 6.5 : 0)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
    
    func onChanged(value: DragGesture.Value) {
        offset = currentIndex == (cards.count - 1) ? 0 : value.translation.height
    }
    
    func onEnded(value: DragGesture.Value) {
        var translation = value.translation.height
        
        translation = (translation < 0 ? -translation : 0)
        translation = (currentIndex == (cards.count - 1) ? 0 : translation)
        
        if translation > 110 {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                cards[currentIndex].isRotated = true
                cards[currentIndex].extraOffset = -350
                cards[currentIndex].scale = 0.7
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                    cards[currentIndex].zIndex = -100
                    for index in cards.indices {
                        cards[index].extraOffset = 0
                    }
                    
                    if currentIndex != (cards.count - 1) {
                        currentIndex += 1
                    }
                    offset = .zero
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                for index in cards.indices {
                    if index == currentIndex {
                        if cards.indices.contains(currentIndex - 1) {
                            cards[currentIndex - 1].zIndex = ZIndex(card: cards[currentIndex - 1])
                        }
                    } else {
                        cards[index].isRotated = false
                        withAnimation(.linear) {
                            cards[index].scale = 1
                        }
                    }
                }
                
                if currentIndex == (cards.count - 1) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        for index in cards.indices {
                            cards[index].zIndex = 0
                        }
                        currentIndex = 0
                    }
                }
            }
        } else {
            offset = .zero
        }
    }
    
    func ZIndex(card: BoomerangCardsModel) -> Double {
        let index = indexOf(card: card)
        let totalCount = cards.count
        
        return currentIndex > index ? Double(index - totalCount) : cards[index].zIndex
    }
    
    // MARK: Scale And Offset Values For Each Card
    func scaleFor(index value: Int) -> Double {
        let index = Double(value - currentIndex)
        if index >= 0 {
            if index > 3 {
                return 0.8
            }
            return 1 - (index / 15)
        } else {
            if -index > 3 {
                return 0.8
            }
            return 1 + (index / 15)
        }
    }
    
    func offsetFor(index value: Int) -> Double {
        let index = Double(value - currentIndex)
        if index >= 0 {
            if index > 3 {
                return 30
            }
            return (index * 10)
        } else {
            if -index > 3 {
                return 30
            }
            return (-index * 10)
        }
    }
    
    func indexOf(card: BoomerangCardsModel) -> Int {
        if let index = cards.firstIndex(where: { CCard in
            CCard.id == card.id
        }) {
            return index
        }
        return 0
    }
}
