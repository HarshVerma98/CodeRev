//
//  NetworkManager.swift
//  UnsplashPhotoService
//
//  Created by Dharini Raghavan on 10/27/23.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

enum API {
    static let baseURL = URL(string: "https://api.unsplash.com")!

    static func makeURL(endpoint: Endpoint) -> URL {
        var components = URLComponents()
        components.scheme = baseURL.scheme
        components.host = baseURL.host
        components.path = endpoint.path
        components.queryItems = endpoint.queryItems
        return components.url!
    }
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() { }
           
    func fetchData<T: Decodable>(from endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        let url = API.makeURL(endpoint: endpoint)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(error))
                    }
                } else if let error = error {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
