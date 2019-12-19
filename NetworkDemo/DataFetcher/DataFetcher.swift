//
//  DataFetcher.swift
//  NetworkDemo
//
//  Created by Admin on 19.12.2019.
//  Copyright © 2019 sergei. All rights reserved.
//

import Foundation

protocol DataFetcher {
    
    typealias RessponseHandler<T: Decodable> = (Result<T, Error>) -> Void
    
    func fetchJSONData<T: Decodable>(url: String, response: @escaping RessponseHandler<T>)
}

extension DataFetcher {
    
    func decodeJSONData<T: Decodable>(type: T.Type, from data: Data) -> T? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(type.self, from: data)
            return decodedData
        } catch let jsonDecodeError {
            print("Failed to decode JSON data: ", jsonDecodeError)
        }
        return nil
    }
}




