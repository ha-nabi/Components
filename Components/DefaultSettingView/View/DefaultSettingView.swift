//
//  DefaultSettingView.swift
//  Components
//
//  Created by 강치우 on 10/6/24.
//

import SwiftUI

struct DefaultSettingView: View {
    @State private var isNotificationsEnabled: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Divider()
                List {
                    // Notification Section
                    Section("Notification") {
                        HStack {
                            Label {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("알림 설정")
                                        .font(.callout)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.7)
                                    
                                    Text("알림 설정에 관한 서브텍스트 입니다.")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                        .lineLimit(1)
                                        .fixedSize()
                                }
                            } icon: {
                                Image(systemName: "bell.fill")
                                    .foregroundStyle(.primary)
                                    .font(.title3)
                            }
                            
                            Spacer()
                            
                            Toggle("", isOn: $isNotificationsEnabled)
                                .tint(Color(.systemGreen))
                        }
                    }
                    .padding(.vertical, 2)
                    .listSectionSeparator(.hidden)
                    
                    // Support Section
                    Section("Support") {
                        supportSectionView()
                    }
                    .padding(.vertical, 2)
                    .listSectionSeparator(.hidden)
                    
                    // Information Section
                    Section("Information") {
                        informationSectionView()
                    }
                    .padding(.vertical, 2)
                    .listSectionSeparator(.hidden)
                    
                    // Links Section
                    Section("Links") {
                        linksSectionView()
                    }
                    .listSectionSeparator(.hidden)
                    
                    // Account Section
                    Section("Account") {
                        accountSectionView()
                    }
                    .padding(.vertical, 2)
                    .listSectionSeparator(.hidden)
                }
                .listStyle(.plain)
                .navigationTitle("설정")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    // MARK: - Support Section View
    @ViewBuilder
    private func supportSectionView() -> some View {
        Button {
            // TODO: 비즈니스 로직
        } label: {
            Label {
                VStack(alignment: .leading, spacing: 4) {
                    Text("평가하기")
                        .font(.callout)
                    Text("앱스토어에서 저희 서비스를 평가해 주세요.")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            } icon: {
                Image(systemName: "star.circle.fill")
                    .font(.title2)
                    .foregroundStyle(.yellow)
            }
        }
        
        Button {
            // TODO: 비즈니스 로직
        } label: {
            Label {
                VStack(alignment: .leading, spacing: 4) {
                    Text("피드백 제공")
                        .font(.callout)
                    Text("제안이나 질문이 있으면 이메일로 보내주세요.")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            } icon: {
                Image(systemName: "envelope.circle.fill")
                    .font(.title2)
                    .foregroundStyle(.primary)
            }
        }
    }
    
    // MARK: - Information Section View
    @ViewBuilder
    private func informationSectionView() -> some View {
        NavigationLink {
            // TODO: WebView
            EmptyView()
        } label: {
            Label {
                Text("개인정보 처리 방침")
            } icon: {
                Image(systemName: "doc.text.fill")
                    .foregroundStyle(.primary)
            }
        }
        
        NavigationLink {
            // TODO: WebView
            EmptyView()
        } label: {
            Label {
                Text("이용 약관")
            } icon: {
                Image(systemName: "doc.text.magnifyingglass")
                    .foregroundStyle(.primary)
            }
        }
    }
    
    // MARK: - Links Section View
    @ViewBuilder
    private func linksSectionView() -> some View {
        Link(destination: URL(string: "https://github.com/ha-nabi")!) {
            Label {
                HStack {
                    Text("GitHub")
                }
            } icon: {
                Image(systemName: "paperclip")
                    .foregroundStyle(.primary)
            }
        }
        
        Link(destination: URL(string: "https://www.instagram.com/dear.kang")!) {
            Label {
                HStack {
                    Text("Instagram")
                }
            } icon: {
                Image(systemName: "paperclip")
                    .foregroundStyle(.primary)
            }
        }
    }
    
    // MARK: - Account Section View
    @ViewBuilder
    private func accountSectionView() -> some View {
        Button {
            // TODO: 비즈니스 로직
        } label: {
            Label {
                Text("로그아웃")
            } icon: {
                Image(systemName: "door.left.hand.open")
                    .foregroundStyle(.primary)
            }
        }
        
        Button {
            // TODO: 비즈니스 로직
        } label: {
            Label {
                Text("탈퇴하기")
                    .foregroundStyle(Color(.systemRed))
            } icon: {
                Image(systemName: "trash.slash.fill")
                    .foregroundStyle(Color(.systemRed))
            }
        }
    }
}

#Preview {
    DefaultSettingView()
}
