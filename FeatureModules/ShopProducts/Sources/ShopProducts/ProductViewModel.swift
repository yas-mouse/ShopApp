//
//  ProductViewModel.swift
//
//
//  Created by yas on 2023/12/26.
//

import SwiftUI
import Repository

class ProductViewModel: ObservableObject {
    @Published private (set) var products: [Product]
    @Published var currentTabIndex = ProductCategory.all.id

    init() {
        products = ProductStore().products
    }

    var category: ProductCategory {
        return ProductCategory(rawValue: currentTabIndex) ?? .all
    }

    var productsByTab: [Product] {
        if case .all = category {
            return products
        } else {
            return products.filter { $0.category == category }
        }
    }
}
