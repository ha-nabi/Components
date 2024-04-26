//
//  ReelView.swift
//  Components
//
//  Created by 강치우 on 11/16/23.
//

import SwiftUI
import AVKit

// Reel View
struct ReelView: View {
    @Binding var reel: Reel
    @Binding var likeCounter: [Like]
    var size: CGSize
    var safeArea: EdgeInsets
    // View Properties
    @State private var player: AVPlayer?
    @State private var looper: AVPlayerLooper?
    var body: some View {
        GeometryReader {
            let rect = $0.frame(in: .scrollView(axis: .vertical))
            // Custom Video Player View
            CustomVideoPlayer(player: $player)
                // Offset Updates
                .preference(key: OffsetKey.self, value: rect)
                .onPreferenceChange(OffsetKey.self, perform: { value in
                    playPause(value)
                })
                .overlay(alignment: .bottom, content: {
                    ReelDetailsView()
                })
                // Double Tap Like Animation
                .onTapGesture(count: 2, perform: { position in
                    let id = UUID()
                    likeCounter.append(.init(id: id, tappedRect: position, isAnimated: false))
                    // Animating Like
                    withAnimation(.snappy(duration: 1.2), completionCriteria:
                            .logicallyComplete) {
                                if let index = likeCounter.firstIndex(where: { $0.id == id }) {
                                    likeCounter[index].isAnimated = true
                                }
                            } completion: {
                                // Removing Like, Once it's Finished
                                 likeCounter.removeAll(where: { $0.id == id })
                            }
                    
                            // Liking the Reel
                    reel.isLiked = true
                })
                // Creating Player
                .onAppear {
                    guard player == nil else { return }
                    guard let bundleID = Bundle.main.path(forResource: reel.videoID, ofType: "mp4") else { return }
                    print("err \(reel.videoID)") // 영상을 못찾는거 같음
                    let videoURL = URL(filePath: bundleID)
                    
                    let playerItem = AVPlayerItem(url: videoURL)
                    let queue = AVQueuePlayer(playerItem: playerItem)
                    looper = AVPlayerLooper(player: queue, templateItem: playerItem)
                    
                    player = queue
                }
             // Clearing Player
                .onDisappear {
                    player = nil
                }
        }
    }
    
    // Play/Pause Action
    func playPause(_ rect: CGRect) {
        if -rect.minY < (rect.height * 0.5) && rect.minY < (rect.height * 0.5) {
            // 스크롤이 반 이상 내려가면 영상이 멈춤
            player?.play()
        } else {
            player?.pause()
        }
        
        if rect.minY >= size.height || -rect.minY >= size.height {
            player?.seek(to: .zero)
        }
    }
    
    // Reel Details & Controls
    @ViewBuilder
    func ReelDetailsView() -> some View {
        HStack(alignment: .bottom, spacing: 10) {
            VStack(alignment: .leading, spacing: 8, content: {
                HStack(spacing: 10) {
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
                    
                    Text(reel.authorName)
                        .font(.callout)
                        .lineLimit(1)
                }
                .foregroundStyle(.white)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .clipped()
            })
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            // Controls View
            VStack(spacing: 35) {
                Button("", systemImage: reel.isLiked ? "suit.heart.fill" : "suit.heart") { 
                    reel.isLiked.toggle()
                }
                .symbolEffect(.bounce, value: reel.isLiked)
                .foregroundStyle(reel.isLiked ? .red : .white)
                
                Button("", systemImage: "message" ) { }
                
                Button("", systemImage: "paperplane" ) { }
                
                Button("", systemImage: "ellipsis" ) { }
            }
            .font(.title2)
            .foregroundStyle(.white)
        }
        .padding(.leading, 15)
        .padding(.trailing, 10)
        .padding(.bottom, safeArea.bottom + 15)
    }
}
