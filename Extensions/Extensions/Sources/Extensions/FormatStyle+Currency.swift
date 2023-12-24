//
//  FormatStyle+Currency.swift
//  ShopApp
//  
//  Created by yas on 2022/10/21
//  
//

import Foundation

extension FormatStyle {

    /// 日本の通貨表記
    /// - Returns: FormatStyle
    public static func JPY<V>() -> Self where Self == IntegerFormatStyle<V>.Currency, V: BinaryInteger {
        return .currency(code: "JPY")
    }
}
