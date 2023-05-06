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
    @StateObject var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView(locationManager: locationManager, vm: vm)
            }
            .preferredColorScheme(.dark)
        }
    }
}
