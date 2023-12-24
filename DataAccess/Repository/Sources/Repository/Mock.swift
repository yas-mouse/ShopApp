//
//  Mock.swift
//  ShopApp
//  
//  Created by yas on 2022/10/20
//  
//

import SwiftUI

public struct Mock {

    public init() {}

    public let products: [Product] = [
        Product(id: UUID(uuidString: "FA06C70A-A06C-4CC8-840C-CB95F9C65E34")!,
                image: Image("apple"),
                name: "りんご",
                price: 120,
                description: "商品1の説明 長い説明 長い説明 長い説明",
                category: .food),
        Product(id: UUID(uuidString: "BC629187-AAB3-4324-852F-0C4692AE4032")!,
                image: Image("banana"),
                name: "バナナ",
                price: 300,
                description: "商品2の説明 長い説明 長い説明 長い説明",
                category: .food),
        Product(id: UUID(uuidString: "2390F80A-1774-4ADE-A7BC-460231F6FBBE")!,
                image: Image("cherry"),
                name: "チェリー",
                price: 120,
                description: "商品3の説明 長い説明 長い説明 長い説明",
                category: .food),
        Product(id: UUID(uuidString: "3C059CB2-37AE-43DA-AB5F-7C4114FA8688")!,
                image: Image("dragonfruit"),
                name: "ドラゴンフルーツ",
                price: 400,
                description: "商品4の説明 長い説明 長い説明 長い説明",
                category: .food),
        Product(id: UUID(uuidString: "DFEFFCBC-0CEA-4638-9792-F8892F54A124")!,
                image: Image("european_pear"),
                name: "洋なし",
                price: 500,
                description: "商品5の説明 長い説明 長い説明 長い説明",
                category: .food),
        Product(id: UUID(uuidString: "316C4BF8-7AB1-4D75-BC3E-FACB4CBAD322")!,
                image: Image("shoes"),
                name: "くつ",
                price: 3000,
                description: "商品6の説明 長い説明 長い説明 長い説明",
                category: .clothes),
        Product(id: UUID(uuidString: "DB61B4AC-20E0-473B-8CB3-701CAF73D4C5")!,
                image: Image("tshirt"),
                name: "Tシャツ",
                price: 4000,
                description: "商品7の説明 長い説明 長い説明 長い説明",
                category: .clothes),
        Product(id: UUID(uuidString: "0D708300-1EA4-4371-89F6-5FF39DCC30FF")!,
                image: Image(""),
                name: "商品8",
                price: 100,
                description: "商品8の説明 長い説明 長い説明 長い説明",
                category: .others),
        Product(id: UUID(uuidString: "A25B7D69-C1AB-46AB-86E1-06CA8D47F974")!,
                image: Image(""),
                name: "商品9",
                price: 100,
                description: "商品9の説明 長い説明 長い説明 長い説明",
                category: .others)
    ]
}
