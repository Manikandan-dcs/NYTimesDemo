//
//  Article.swift
//  MasterDetailDemo
//
//  Created by Manikandan Sundararajan on 18/11/18.
//  Copyright © 2018 Manikandan Sundararajan. All rights reserved.
//

import Foundation

class Article {
    
    init() {
        
    }
    
    init(dict : [String : Any]) {
        statusValue = dict["status"]
        numResultsValue = dict["num_results"]
        resultsValue = dict["results"]
    }
    
    private var statusValue : Any!
    var status : String {
        get {
            return statusValue as? String ?? ""
        }
    }
    
    private var numResultsValue : Any!
    var numResults : Int {
        get {
            return numResultsValue as? Int ?? 0
        }
    }
    
    private var resultsValue : Any!
    var results : [ArticleResult] {
        get {
            guard let items = resultsValue as? [[String : Any]] else { return [ArticleResult]() }
            let values = items.map({ (dict) -> ArticleResult in
                ArticleResult(dict: dict)
            })
            return values
        }
    }
}

class ArticleResult {
    
    init() {
        
    }
    
    init(dict : [String : Any]) {
        urlValue = dict["url"]
        titleValue = dict["title"]
        abstractValue = dict["abstract"]
        publishedDateValue = dict["published_date"]
        mediaValue = dict["media"]
        byLineValue = dict["byline"]
        sectionValue = dict["section"]
    }
    
    private var urlValue : Any!
    var url : String {
        get {
            return urlValue as? String ?? ""
        }
    }
    
    private var titleValue : Any!
    var title : String {
        get {
            return titleValue as? String ?? ""
        }
    }
    
    private var byLineValue : Any!
    var byLine : String {
        get {
            return byLineValue as? String ?? ""
        }
    }
    
    private var sectionValue : Any!
    var section : String {
        get {
            return sectionValue as? String ?? ""
        }
    }
    
    private var abstractValue : Any!
    var abstract : String {
        get {
            return abstractValue as? String ?? ""
        }
    }
    
    private var publishedDateValue : Any!
    var publishedDate : String {
        get {
            return publishedDateValue as? String ?? ""
        }
    }
    
    var mediaValue : Any!
    var media : [Any] {
        get {
            guard let items = mediaValue as? [Any] else { return [Any]() }
            return items
        }
    }
    
    var mediaMetaData : [Any] {
        get {
            if media.count > 0, let item = media[0] as? [String : Any] {
                
                if let metaData = item["media-metadata"] as? [Any] {
                    return metaData
                }
            }
            
            return [Any]()
        }
    }
    
    var mediaURL : String {
        get {
            if mediaMetaData.count > 0, let firstMedia = mediaMetaData[0] as? [String : Any], let url = firstMedia["url"] as? String {
                return url
            }
            
            return ""
        }
    }
}


