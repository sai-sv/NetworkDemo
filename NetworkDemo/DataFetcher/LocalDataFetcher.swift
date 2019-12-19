//
//  LocalDataFetcher.swift
//  NetworkDemo
//
//  Created by Admin on 19.12.2019.
//  Copyright © 2019 sergei. All rights reserved.
//

import Foundation

class LocalDataFetcher: DataFetcher {
    
    func fetchJSONData<T: Decodable>(url: String, response: @escaping RessponseHandler<T>) {
        
        guard let url = Bundle.main.url(forResource: url, withExtension: nil) else {
            print("File not exist")
            let error: Error = NSError(domain: "domain", code: 1, userInfo: nil)
            response(.failure(error))
            return
        }
        
        guard let data = try? Data(contentsOf: url) else {
            let error = NSError()
            response(.failure(error))
            return
        }
        
        guard let decodedData = self.decodeJSONData(type: T.self, from: data) else {
            let error = NSError()
            response(.failure(error))
            return
        }
        response(.success(decodedData))
    }
}
