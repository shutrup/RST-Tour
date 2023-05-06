//
//  HomeViewModel.swift
//  TestApp
//
//  Created by Шарап Бамматов on 05.05.2023.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    //MARK: - DI
    let networkManager: NetworkManagerProtocol
    
    static let homeViewModel = HomeViewModel(networkManager: NetworkManager())
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    @Published var array: [Object] = []
    
    @MainActor
    func fetchData() async throws {
        do {
            let data = try await networkManager.fetchData()
            self.array = data.data.objects
        } catch {
            print("Error")
        }
    }
    
}
