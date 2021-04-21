//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Rodrigo Oliveira on 4/19/21.
//

import UIKit

protocol NewsWorkerManager {
    func getNews(completion: @escaping (Result<News, Error>) -> Void)
}

class NewsTableViewController: UITableViewController {
    
    // MARK: - Attributes
    
    let manager = NewsNetworkManager()
    var news: News? = nil
        
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNews { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let news):
                self.successRequestNews(news: news)
            case .failure(let error):
                self.failureRequestNews(error: error)
            }
        }
        
        setup()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    // MARK: - Private functions
    
    private func setup() {
        self.title = "Good News"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func getNews(completion: @escaping (Result<News, Error>) -> Void) {
        manager.getNews(completion: completion)
    }
    
    private func successRequestNews(news: News) {
        self.news = news
    }
    
    private func failureRequestNews(error: Error) {
        let nsError = error as NSError
        if nsError.code == NSURLErrorNotConnectedToInternet {
            print("Not connected to internet")
        } else {
            print("Unexpected error")
        }
    }
    
}
