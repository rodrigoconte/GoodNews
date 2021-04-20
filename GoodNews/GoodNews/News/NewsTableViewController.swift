//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Rodrigo Oliveira on 4/19/21.
//

import UIKit

class NewsTableViewController: UITableViewController {
        
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}
