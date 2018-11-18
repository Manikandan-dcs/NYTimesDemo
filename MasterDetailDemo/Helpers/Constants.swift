//
//  Constants.swift
//  MasterDetailDemo
//
//  Created by Manikandan Sundararajan on 17/11/18.
//  Copyright © 2018 Manikandan Sundararajan. All rights reserved.
//

import Foundation

struct APIConstants {
    
    static let apiKey = "fe8ebadf9d8c47278b99ef52a1089d31"
    
    static let BASE_URL = "http://api.nytimes.com"
    
    static let section = "all-sections"
    
    static let period = "7"
    
    static let article_URL = BASE_URL + "/svc/mostpopular/v2/mostviewed/\(section)/\(period).json?api-key=\(apiKey)"
}

struct NavigationTitle {
    
    static let mostPopularArticle = "NY Times Most Popular"
}

struct TableViewCellConstants {
    
    struct Nib {
        static let articleListCell = "ArticleListCell"
    }
    
    struct Identifier {
        static let articleList = "list"
    }
    
}
