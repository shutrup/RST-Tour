//
//  TestAppApp.swift
//  TestApp
//
//  Created by Шарап Бамматов on 04.05.2023.
//

import SwiftUI

@main
struct TestAppApp: App {
    @StateObject private var vm = HomeViewModel.homeViewModel
    
    var body: some Scene {
        WindowGroup {
            HomeView(vm: vm)
        }
    }
}
