//
//  ContentView.swift
//  ShopApp
//
//  Created by yas on 2023/12/19.
//

import SwiftUI

public struct ContentView: View {
    
    public init() {}

    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
