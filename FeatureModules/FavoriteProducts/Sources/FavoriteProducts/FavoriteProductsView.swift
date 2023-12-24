//
//  FavoriteProductsView.swift
//  ShopApp
//  
//  Created by yas on 2022/10/24
//  
//

import SwiftUI
import Repository
import ShopProducts

public struct FavoriteProductsView: View {

    public init() {}

    @EnvironmentObject var user: User

    public var body: some View {
        List {
            ForEach($user.favoriteProducts) { product in
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    HStack {
                        product.wrappedValue.image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)

                        Text(product.wrappedValue.name)

                        Spacer()
                    }
                }
            }
        }
    }
}

struct FavoriteProductsView_Previews: PreviewProvider {

    var dummyUser = User()

    init() {
        dummyUser.favoriteProducts = ProductStore().products
    }

    static var previews: some View {
        FavoriteProductsView()
            .environmentObject({ () -> User in
                let dummyUser = User()
                dummyUser.favoriteProducts = ProductStore().products
                return dummyUser
            }() )
    }
}
