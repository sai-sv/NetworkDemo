//
//  ViewController.swift
//  NetworkDemo
//
//  Created by Admin on 19.12.2019.
//  Copyright © 2019 sergei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let dataFetcher = DataFetcherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remoteFetchPosts()
        localFetchPosts()
    }
    
    private func remoteFetchPosts() {
        dataFetcher.fetchPosts { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                print(data.first?.title)
                break;
            }
        }
    }
    
    private func localFetchPosts() {
        dataFetcher.fetchLocalPosts { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                print(data.first?.title)
                break;
            }
        }
    }
}

