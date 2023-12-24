//
//  ProductsView.swift
//  ShopApp
//  
//  Created by yas on 2022/10/11
//  
//

import SwiftUI
import Repository

public struct ProductsView: View {

    @State private var products: [Product]
    private var columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)

    public init(products: [Product]) {
        self.products = products
    }

    public var body: some View {

        ScrollView(.vertical) {
            LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                ForEach($products) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        ProductView(product: product)
                    }
                }
            }
            .padding()
        }
    }
}

struct ProductsView_Previews: PreviewProvider {

    @State static var products = ProductStore().products

    static var previews: some View {
        ProductsView(products: products)
            .environmentObject(User())
            .previewInterfaceOrientation(.portrait)
    }
}
