// NetworkManager.swift
import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()

    func fetchPhotosForTopic(topic: String, page: Int, completion: @escaping ([ImageDataModel]?, Error?) -> Void) {
        let accessKey = "X1aMMWNJ1IfPqR4q_flSQzqV-YiAXxPnJ5YA8B9SwMc"
        let apiUrl = "https://api.unsplash.com/topics/\(topic)/photos?page=\(page)&client_id=\(accessKey)"

        if let url = URL(string: apiUrl) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                } else if let data = data {
                    do {
                        let json = try JSONDecoder().decode([ImageDataModel].self, from: data)
                        completion(json, nil)
                    } catch {
                        completion(nil, error)
                    }
                }
            }
            task.resume()
        }
    }
    
     func fetchAllTopics(completion: @escaping ([ImageDataModel]) -> ()) {
        let accessKey = "X1aMMWNJ1IfPqR4q_flSQzqV-YiAXxPnJ5YA8B9SwMc"
        let apiUrl = "https://api.unsplash.com/topics?client_id=\(accessKey)"
        
        if let url = URL(string: apiUrl) {
            let session = URLSession.shared
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                } else if let data = data {
                    do {
                        let json = try JSONDecoder().decode([ImageDataModel].self, from: data)
                        completion(json)
                    } catch {
                        print("Error parsing JSON: \(error.localizedDescription)")
                        completion([])
                    }
                }
            }
            task.resume()
        }
    }
}
