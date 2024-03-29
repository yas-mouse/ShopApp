//
//  ShopAppApp.swift
//  ShopApp
//
//  Created by yas on 2023/12/19.
//

import SwiftUI
import Root
import Repository

@main
struct ShopAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(User())
        }
    }
}
