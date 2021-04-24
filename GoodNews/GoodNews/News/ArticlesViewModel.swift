//
//  NewsViewModel.swift
//  GoodNews
//
//  Created by Rodrigo Oliveira on 4/19/21.
//

import Foundation

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    
    init(_ article: Article) {
        self.article = article
    }
    
}

extension ArticleViewModel {
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.articleDescription ?? "-"
    }
    
}


struct ArticlesListViewModel {
    let articles: [Article]
}

extension ArticlesListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func rowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
}
