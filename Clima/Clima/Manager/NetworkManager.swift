//
//  NetworkManager.swift
//  Clima
//
//  Created by Melih Başayiğit on 31.12.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // Functions
    
    func call(with request: URLRequest, completion: @escaping (Result<Data,Error>) -> ()) {
        let task = session.dataTask(with: request) { data, response, error in

            // check error
            if error == nil {
                if let checkData = data {
                    completion(.success(checkData))
                } else {
                    completion(.failure(NetworkError.NO_DATA))
                }
            } else {
                completion(.failure(NetworkError.CONNECTION_FAILURE))
            }
        }
        task.resume()
    }
}
