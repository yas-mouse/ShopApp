//
//  ProductDetailView.swift
//  ShopApp
//  
//  Created by yas on 2022/10/17
//  
//

import SwiftUI
import Repository
import Extensions

public struct ProductDetailView: View {
    @Binding var product: Product
    @EnvironmentObject var user: User
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    public init(product: Binding<Product>) {
        self._product = product
    }

    func isFavorite(product: Product) -> Bool {
        return user.favoriteProducts.contains(where: { $0.id == product.id })
    }

    public var body: some View {

        ZStack {

            VStack {

                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        product.image
                            .resizable()
                            .scaledToFit()

                        HStack(alignment: .center, spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                Text(product.name)
                                    .font(.title)
                                    .foregroundColor(.primary)
                                    .fontWeight(.semibold)
                                    .padding([.leading, .bottom], 8.0)
                                Text(product.price, format: .JPY())
                                    .font(.title)
                                    .foregroundColor(.red)
                                    .fontWeight(.semibold)
                                    .padding([.leading, .bottom], 8.0)
                            }

                            Spacer()

                            Button {
                                user.toggleFavoriteProduct(product: product)
                            } label: {
                                Image(systemName: user.isFavoriteProduct(product: product) ? "heart.fill" : "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40)
                                    .foregroundColor(user.isFavoriteProduct(product: product) ? .pink : .gray)
                            }
                            .padding(.trailing, 16.0)
                        }

                        Text(product.description)
                            .padding([.leading, .bottom], 8.0)
                        Spacer()
                    }
                    .frame(height: 800, alignment: .leading)
                }

                Spacer()

                VStack {
                    HStack {
                        Spacer()

                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Circle()
                                .fill(.gray)
                                .frame(width: 50, height: 50)
                                .overlay {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)

                                }
                        }

                        Spacer()
                            .frame(width: 16)

                        Button {
                            // TODO: カート処理
                        } label: {
                            Rectangle()
                                .fill(.blue)
                                .frame(height: 50)
                                .cornerRadius(10)
                                .overlay {
                                    HStack {
                                        Image(systemName: "cart")
                                            .foregroundColor(.white)
                                        Text("カートに入れる")
                                            .foregroundColor(.white)

                                    }
                                }
                        }

                        Spacer()
                    }
                    .padding()

                    Spacer()
                        .frame(height: 20)
                }
                .background(.white)
                .clipped()
                .shadow(radius: 4)
            }
            .ignoresSafeArea(edges: .bottom)

        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    @State static var product = ProductStore().products.first!

    static var previews: some View {
        ProductDetailView(product: $product)
            .environmentObject(User())
    }
}
