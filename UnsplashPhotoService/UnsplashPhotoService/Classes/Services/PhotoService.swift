//
//  PhotoService.swift
//  UnsplashPhotoService
//
//  Created by Dharini Raghavan on 10/29/23.
//

import Foundation

final public class PhotoService {
    
    public static var shared: PhotoService = PhotoService()
    let configuration = UnsplashServiceConfiguration(
        accessKey: "oNf7rL7aqPQu7bIVe6yXz3wuv-X-1z5kQ15F6haQ9PM",
        secretKey: "CtcZ4vO5djteHshJiPHp4TXUFtwEcpfKAWsk5DSgsLI"
    )

    private init(){
    }
    
    public func getTopic(topicID: String, completion: @escaping (Result<UnsplashTopic, Error>) -> Void) {
        let endpoint = Endpoint(path: "/topics/\(topicID)", queryItems: [URLQueryItem(name: "client_id", value: String(configuration.accessKey))])

        NetworkManager.shared.fetchData(from: endpoint, completion: completion)
    }
    
    public func getTopics(page: Int = 1, completion: @escaping (Result<[UnsplashTopic], Error>) -> Void) {
        let endpoint = Endpoint(path: "/topics", queryItems: [URLQueryItem(name: "client_id", value: String(configuration.accessKey)), URLQueryItem(name: "page", value: String(page))])
        
        NetworkManager.shared.fetchData(from: endpoint, completion: completion)
    }
    
    public func getTopicPhotos(topicID: String, page: Int = 1, completion: @escaping (Result<[UnsplashPhoto], Error>) -> Void) {
        let endpoint = Endpoint(path: "/topics/\(topicID)/photos", queryItems: [URLQueryItem(name: "client_id", value: String(configuration.accessKey)), URLQueryItem(name: "page", value: String(page))])
        
        NetworkManager.shared.fetchData(from: endpoint, completion: completion)
    }
    
}
