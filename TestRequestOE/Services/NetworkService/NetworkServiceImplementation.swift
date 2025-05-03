//
//  NetworkServiceImplementation.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import Foundation

enum NetworkLoadEvent {
    case first
    case loadMore(String)
}

final class NetworkServiceImplementation {
    
    private var session: URLSession
    private let encoder = JSONEncoder()
    private let baseUrl = "https://frontend-test-assignment-api.abz.agency/api/v1"
    let users = "/users"
    var page: Int = 1
    let count: Int = 5
    
    init(session: URLSession) {
        self.session = session
    }
}

extension NetworkServiceImplementation: NetworkService {
    
    func fetchUsers(load: NetworkLoadEvent, completionHandler: @escaping (Result<ResponseUser, Error>) -> Void) {
        
        var urlStr = baseUrl
        
        switch load {
        case .first:
            urlStr = urlStr + users + "?page=\(page)&count=\(count)"
        case .loadMore(let more):
            urlStr = more
        }
        
        let completionBlock: (Result<ResponseUser, Error>) -> Void = { result in
            DispatchQueue.main.async {
                completionHandler(result)
            }
        }
        
        guard let url = URL(string: urlStr) else {
            completionBlock(.failure(URLError(.badURL)))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = self.session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            // Handle networking errors
            if let error = error {
                completionBlock(.failure(error))
                return
            }
            
            // Check HTTP response status
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completionBlock(.failure(URLError(.badServerResponse)))
                return
            }
            
            // Parse JSON data
            guard let data = data else {
                completionBlock(.failure(URLError(.cannotParseResponse)))
                return
            }
            
            do {
                let model = try JSONDecoder().decode(ResponseUser.self, from: data)
                completionBlock(.success(model))
            } catch {
                completionBlock(.failure(error))
            }
        }
        task.resume()
    }
}
