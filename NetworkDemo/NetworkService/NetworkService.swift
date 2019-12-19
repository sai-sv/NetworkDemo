//
//  NetworkService.swift
//  NetworkDemo
//
//  Created by Admin on 19.12.2019.
//  Copyright © 2019 sergei. All rights reserved.
//

import Foundation

protocol NetworkService: class {
    typealias CompletionHandler = (Result<Data, Error>) -> Void
    
    var configuration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func request(url: String, completion: @escaping CompletionHandler)
    func request(urlRequest: URLRequest, completion: @escaping CompletionHandler)
}

class BaseNetworkService: NetworkService {
    
    var configuration: URLSessionConfiguration
    lazy var session: URLSession = { [unowned self] in
        return URLSession(configuration: self.configuration)
    }()
    
    init(configuration: URLSessionConfiguration) {
        self.configuration = configuration
    }
    
    init() {
        self.configuration = URLSessionConfiguration.default
    }
    
    func request(url: String, completion: @escaping CompletionHandler) {
        
        guard let url = URL(string: url) else { return }
        
        let request = URLRequest(url: url)
        self.request(urlRequest: request, completion: completion)
    }
    
    func request(urlRequest: URLRequest, completion: @escaping CompletionHandler) {

        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                print(error!)
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            
            guard let data = data else {
                
                let userInfo = [String: Any]()
                let error = NSError(domain: "domain", code: 1, userInfo: userInfo)
                
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }
        task.resume()
    }
}
