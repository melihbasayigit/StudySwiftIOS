//
//  WeatherService.swift
//  Clima
//
//  Created by Melih Başayiğit on 31.12.2023.
//

import Foundation

class WeatherService {
    private let networkManager: NetworkManager = .shared
    
    func getData(urlString: String, completion: @escaping (Result<Data,Error>) -> ()) {
        let request = URLRequest(url: URL(string: urlString)!)
        networkManager.call(with: request) { result in
            completion(result)
        }
    }
}
