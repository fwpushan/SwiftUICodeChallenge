//
//  ApiCall.swift
//  CodeChallenge
//
//  Created by Pushan  on 2022-06-17.
//  Copyright © 2022 io.freshwork. All rights reserved.
//

import Foundation

enum APIError: Error {
    case urlError
    case networkError
    case jsonParseError
    case emptyResponse
}

struct APICaller {
    
    weak var task: URLSessionTask?
    
    mutating func getIP(completion: @escaping (Result<String, APIError>) -> Void) {
        self.task?.cancel()
        guard let url =  URL(string: "http://ip.jsontest.com") else {
            completion(.failure(.urlError))
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, err) in
            guard let httpRes = response as? HTTPURLResponse, httpRes.statusCode == 200,
                let respData = data
            else {
                print("API: getIP: sync: Fail with status code \(String(describing: err))")
                completion(.failure(.networkError))
                return
            }
            do {
                
                if let json: [String: String] = try JSONSerialization.jsonObject(with: respData, options: .mutableContainers) as? [String : String] {
                    completion(.success(json["ip"] ?? "No Value"))
                } else {
                    completion(.failure(.emptyResponse))
                }
                
            } catch let parseError as NSError {
                print("API: getIP: sync: json pars error \(parseError.localizedDescription)")
                completion(.failure(.jsonParseError))
                
                return
            }
        })
        self.task = task;
        task.resume()
    }
    
    func getIp() async throws -> Result<String, APIError> {
        guard let url =  URL(string: "http://ip.jsontest.com") else {
            return .failure(.urlError)
        }
        do {
            let networkResponse = try await URLSession.shared.data(from: url)
            if let httpResp = networkResponse.1 as? HTTPURLResponse, httpResp.statusCode == 200 {
                let respData: Data = networkResponse.0
                if let json: [String: String] = try JSONSerialization.jsonObject(with: respData, options: .mutableContainers) as? [String : String] {
                    return .success(json["ip"] ?? "No value")
                } else {
                    return .failure(.emptyResponse)
                }
            } else {
                return .failure(.networkError)
            }
        } catch let error {
            print("Data fetch fail with error \(error)")
            throw error
        }
    }
}
