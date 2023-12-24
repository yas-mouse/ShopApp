//
//  User.swift
//  ShopApp
//  
//  Created by yas on 2022/10/24
//  
//

import Foundation

@MainActor
public class User: ObservableObject {
    @Published public var favoriteProducts: [Product] = []
    @Published public var searchedWords: [String] {
        didSet {
            UserDefaults.standard.set(searchedWords, forKey: User.searchedWordsKey)
        }
    }

    public init() {
        searchedWords = UserDefaults.standard.array(forKey: User.searchedWordsKey) as? [String] ?? []
    }
}

extension User {

    static let searchedWordsKey = "searchedWords"

    public func isFavoriteProduct(product: Product) -> Bool {
        return favoriteProducts.contains(where: { $0 == product })
    }

    public func toggleFavoriteProduct(product: Product) {
        if let index = favoriteProducts.firstIndex(where: { $0 == product }) {
            favoriteProducts.remove(at: index)
        } else {
            favoriteProducts.insert(product, at: 0)
        }
    }

    /// 検索した文字追加
    /// - Parameter word: 検索した文字
    public func addSearchedWord(word: String) {
        var words: [String] = []
        if let savedWords = UserDefaults.standard.array(forKey: User.searchedWordsKey) as? [String] {
            if savedWords.contains(word) {
                // 同じ文字は保存しない
                return
            }

            words = savedWords
            words.insert(word, at: 0)
        }
        searchedWords = words
    }

    public func removeSearchedWord(offsets: IndexSet) {
        guard var savedWords = UserDefaults.standard.array(forKey: User.searchedWordsKey) as? [String] else {
            return
        }

        savedWords.remove(atOffsets: offsets)
        searchedWords = savedWords
    }
}
