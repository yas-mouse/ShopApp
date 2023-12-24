//
//  Product.swift
//  ShopApp
//  
//  Created by yas on 2022/10/11
//  
//

import Foundation
import SwiftUI

public struct Product: Identifiable, Equatable {
    public let id: UUID
    public let image: Image
    public let name: String
    public let price: Int
    public let description: String
    public let category: ProductCategory
}

public enum ProductCategory: Int, CaseIterable, Identifiable {
    case all = 0
    case clothes
    case food
    case others

    public var id: Int { rawValue }

    public var title: String {
        switch self {
        case .all: return "すべて"
        case .clothes: return "衣服"
        case .food: return "食品"
        case .others: return "その他"
        }
    }
}
