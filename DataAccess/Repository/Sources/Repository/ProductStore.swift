//
//  ProductStore.swift
//  
//
//  Created by yas on 2023/12/26.
//

import Foundation

public class ProductStore: ObservableObject {
    
    @Published public var products: [Product]

    public init() {
        products = Mock().products
    }
}
