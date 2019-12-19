//
//  DataFetcherManager.swift
//  NetworkDemo
//
//  Created by Admin on 19.12.2019.
//  Copyright © 2019 sergei. All rights reserved.
//

import Foundation


class DataFetcherManager {
    
    private var networkDataFetcher: DataFetcher
    private var localDataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher(),
         localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.networkDataFetcher = dataFetcher
        self.localDataFetcher = localDataFetcher
    }
    
    func fetchPosts(response: @escaping (Result<[PostModel], Error>) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/posts"
        self.networkDataFetcher.fetchJSONData(url: url, response: response)
    }
    
    func fetchLocalPosts(response: @escaping (Result<[PostModel], Error>) -> Void) {
        let file = "posts"
        localDataFetcher.fetchJSONData(url: file, response: response)
    }    
}
