//
//  NetworkDataFetcher.swift
//  NetworkDemo
//
//  Created by Admin on 19.12.2019.
//  Copyright © 2019 sergei. All rights reserved.
//

import Foundation

class NetworkDataFetcher: DataFetcher {
    
    private var networkService: NetworkService
  
    init(networkService: NetworkService = BaseNetworkService()) {
        self.networkService = networkService
    }
    
    func fetchJSONData<T: Decodable>(url: String, response: @escaping RessponseHandler<T>) {
        
        networkService.request(url: url) { (result) in
            
            switch result {
            case .success(let data):
                
                guard let decodedData = self.decodeJSONData(type: T.self, from: data) else {
                    let error = NSError()
                    response(.failure(error))
                    return
                }
                response(.success(decodedData))
                break
                
            case .failure(let error):
                response(.failure(error))
                break
            }
        }
    }
}
