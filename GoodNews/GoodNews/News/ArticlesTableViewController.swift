//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Rodrigo Oliveira on 4/19/21.
//

import UIKit

protocol ArticlesWorkerManager {
    func getNews(completion: @escaping (Result<News, Error>) -> Void)
}

class ArticlesTableViewController: UITableViewController {
    
    // MARK: - Attributes
    
    let manager = ArticlesNetworkManager()
    var news: News? = nil {
        didSet {
            setViewModel()
        }
    }
    var articleListViewModel: ArticlesListViewModel!
        
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private functions
    
    private func setup() {
        
        self.title = "Good News"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isHidden = false
        
        registerTableViewCell()
        fetchNews()
    }
    
    private func fetchNews() {
        getNews { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let news):
                self.successRequestNews(news: news)
            case .failure(let error):
                self.failureRequestNews(error: error)
            }
        }
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: ArticlesTableViewCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ArticlesTableViewCell.nibName)
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
    
    private func setViewModel() {
        if let articles = news?.articles {
            articleListViewModel = ArticlesListViewModel(articles: articles)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

// MARK: - Table view data source

extension ArticlesTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return articleListViewModel == nil ? 0 : articleListViewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListViewModel.rowsInSection(section)
    }
    
}

// MARK: - Table view delegate

extension ArticlesTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesTableViewCell.nibName, for: indexPath) as! ArticlesTableViewCell
        
        let articleViewModel = articleListViewModel.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description
        
        return cell
    }
    
}
