//
//  ContentView.swift
//  ShopApp
//
//  Created by yas on 2023/12/19.
//

import SwiftUI
import FavoriteProducts
import ShopProducts

public struct ContentView: View {
    
    @State private var selectedTab: Tabs = .home
    @State private var navigationTitle: String = Tabs.products.rawValue

    enum Tabs: String {
        case home = "ホーム"
        case products = "商品一覧"
        case favoriteProducts = "お気に入り"

        var navigationBarHidden: Bool {
            // ホームは消す
            return self == .home
        }
    }

    public init() {}

    public var body: some View {
        ZStack {
            NavigationView {
                TabView(selection: $selectedTab) {
                    ProductTabsView()
                        .tabItem {
                            VStack {
                                Image(systemName: "list.bullet.rectangle.portrait")
                                Text(Tabs.products.rawValue)
                            }
                        }
                        .tag(Tabs.products)

                    FavoriteProductsView()
                        .tabItem {
                            VStack {
                                Image(systemName: "heart")
                                Text(Tabs.favoriteProducts.rawValue)
                            }
                        }
                        .tag(Tabs.favoriteProducts)

                }
                .navigationTitle(selectedTab.rawValue)
                .navigationBarHidden(selectedTab.navigationBarHidden)
                .onChange(of: selectedTab) { tab in
                    navigationTitle = tab.rawValue
                }
            }
            .navigationViewStyle(.stack)

        }
    }
}

#Preview {
    ContentView()
}
