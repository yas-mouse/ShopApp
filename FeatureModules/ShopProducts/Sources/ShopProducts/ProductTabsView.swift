//
//  ProductTabsView.swift
//  ShopApp
//  
//  Created by yas on 2022/10/28
//  
//

import SwiftUI
import Repository

public struct ProductTabsView: View {
    @Namespace var namespace
    @EnvironmentObject var user: User
    @StateObject var viewModel: ProductViewModel = ProductViewModel()

    public init() {}

    public var body: some View {

        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {

                HStack(spacing: 20) {
                    ForEach(ProductCategory.allCases) { tab in
                        SlidableTabBarItem(
                            title: tab.title,
                            tabIndex: tab.id,
                            namespace: namespace,
                            currentTabIndex: $viewModel.currentTabIndex
                        )
                    }
                }
                .frame(height: 48)
                .background(.clear)
                .padding(.horizontal)
            }

            TabView(selection: $viewModel.currentTabIndex) {
                ForEach(ProductCategory.allCases) { tab in
                    ProductsView(products: viewModel.productsByTab)
                        .tag(tab.id)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct ProductTabsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductTabsView()
            .environmentObject(User())
    }
}
