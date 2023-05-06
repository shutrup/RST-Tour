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
        Task {
            try? await fetchData()
        }
    }
    
    @Published var recreationCenters: RecreationCenters? 
    
    @MainActor
    func fetchData() async throws {
        do {
            let returnedData = try await networkManager.fetchData()
            self.recreationCenters = returnedData.data
        } catch {
            print("Error")
        }
    }
    
}
