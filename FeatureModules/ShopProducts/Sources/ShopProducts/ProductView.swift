//
//  ProductView.swift
//  ShopApp
//  
//  Created by yas on 2022/10/12
//  
//

import SwiftUI
import Repository

public struct ProductView: View {
    @Binding var product: Product
    @EnvironmentObject var user: User

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            product.image
                .resizable()
                .scaledToFit()
                .frame(height: 220)

            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(product.name)
                        .foregroundColor(.black)
                        .padding([.leading, .bottom], 8.0)
                    Text(product.price, format: .JPY())
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                        .padding([.leading, .bottom], 8.0)
                }

                Spacer()

                Button {
                    user.toggleFavoriteProduct(product: product)
                } label: {
                    Image(systemName: user.isFavoriteProduct(product: product) ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(user.isFavoriteProduct(product: product) ? .pink : .gray)
                }
                .padding(.trailing, 16.0)
            }
        }
        .frame(maxWidth: 250,
               maxHeight: 600)
        .background(.white)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

struct ProductView_Previews: PreviewProvider {
    @State static var product = ProductStore().products.first!

    static var previews: some View {
        ProductView(product: $product)
            .environmentObject(User())
    }
}
