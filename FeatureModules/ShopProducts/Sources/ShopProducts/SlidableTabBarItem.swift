//
//  SlidableTabBarItem.swift
//  ShopApp
//  
//  Created by yas on 2022/10/31
//  
//

import SwiftUI
import Repository

public struct SlidableTabBarItem: View {

    var title: String
    var tabIndex: Int
    var namespace: Namespace.ID
    @Binding var currentTabIndex: Int

    public var body: some View {
        Button {
            withAnimation(.spring()) {
                currentTabIndex = tabIndex
            }
        } label: {
            VStack {
                Spacer()
                Text(title)
                    .foregroundColor(currentTabIndex == tabIndex ? .primary : .secondary)
                if currentTabIndex == tabIndex {
                    Color.primary
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "SlidableTabBarItem", in: namespace, properties: .frame)
                } else {
                    Color.clear
                        .frame(height: 2)
                }
            }
            .animation(.spring(), value: currentTabIndex)
        }
        .buttonStyle(.plain)
    }
}

struct SlidableTabBarItem_Previews: PreviewProvider {

    @State static var currentTabIndex = 0
    @Namespace static var namespace

    static var previews: some View {

        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(ProductCategory.allCases) { tab in
                    SlidableTabBarItem(title: tab.title, tabIndex: tab.rawValue, namespace: namespace, currentTabIndex: $currentTabIndex)
                }
            }
            .frame(height: 48)
            .background(.white)
        }
    }
}
