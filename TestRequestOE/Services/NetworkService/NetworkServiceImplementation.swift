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
    let token = "/token"
    var page: Int = 1
    let count: Int = 5
    
    init(session: URLSession) {
        self.session = session
    }
}

extension NetworkServiceImplementation: NetworkService {
    
    func postUser(user: RegistrUser) {
        let token = ""
        // 1. Prepare URL and request
        guard let url = URL(string: baseUrl + users) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        // 2. Prepare the body
     //   let user = User(name: "John Doe", email: "john@example.com")
        guard let httpBody = try? JSONEncoder().encode(user) else { return }
        request.httpBody = httpBody

        // 3. Send request
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("❌ Error: \(error)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("✅ Status Code: \(httpResponse.statusCode)")
            }

            if let data = data {
                if let responseBody = try? JSONSerialization.jsonObject(with: data) {
                    print("📦 Response Body:", responseBody)
                } else {
                    print("⚠️ Could not parse response body")
                }
            }
        }.resume()
    }
    
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
    
    func getToken(completionHandler: @escaping (Result<TokenModel, Error>) -> Void) {
        
        var urlStr = baseUrl + token
        
        let completionBlock: (Result<TokenModel, Error>) -> Void = { result in
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
                let model = try JSONDecoder().decode(TokenModel.self, from: data)
                completionBlock(.success(model))
            } catch {
                completionBlock(.failure(error))
            }
        }
        task.resume()
    }
    
    func getPosition(completionHandler: @escaping (Result<[OwnPosition], Error>) -> Void) {
        
        var urlStr = baseUrl + token
        
        let completionBlock: (Result<[OwnPosition], Error>) -> Void = { result in
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
                let model = try JSONDecoder().decode(PositionModel.self, from: data)
                completionBlock(.success(model.positions))
            } catch {
                completionBlock(.failure(error))
            }
        }
        task.resume()
    }
}
