//
//  GoldenListApp.swift
//  GoldenList
//
//  Created by Maciej Sołoducha on 10/07/2023.
//

import SwiftUI

@main
struct GoldenListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
