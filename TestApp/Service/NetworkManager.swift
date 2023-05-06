//
//  NetworkManager.swift
//  TestApp
//
//  Created by Шарап Бамматов on 06.05.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchData() async throws -> RecreationCenter
}

final class NetworkManager: NetworkManagerProtocol {
    func fetchData() async throws -> RecreationCenter {
        guard let url = URL(string: "https://rsttur.ru/api/base-app/map") else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        return try JSONDecoder().decode(RecreationCenter.self, from: data)
    }
}
