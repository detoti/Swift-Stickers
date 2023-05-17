//
//  StickersApp.swift
//  Stickers
//
//  Created by André Toti on 05/04/23.
//

import SwiftUI

@main
struct StickersApp: App {
    var body: some Scene {
        let minhaColecao = MinhaColecao()
        WindowGroup {
            ContentView()
                .environmentObject(minhaColecao)
        }
    }
}
