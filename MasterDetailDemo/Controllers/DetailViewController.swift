//
//  DetailViewController.swift
//  MasterDetailDemo
//
//  Created by Manikandan Sundararajan on 17/11/18.
//  Copyright © 2018 Manikandan Sundararajan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var detail = ArticleResult()
    
    func configureView() {
        
        if !detail.url.isEmpty {
            print(detail.url)
            if let myURL = URL(string:detail.url) {
                let myRequest = URLRequest(url: myURL)
                webView.loadRequest(myRequest)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // webView.navigationDelegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        configureView()
    }
    
//    private func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
//        print(error.localizedDescription)
//    }
//    private func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
//        print("Strat to load")
//        activityIndicator.isHidden = false
//        activityIndicator.startAnimating()
//    }
//    private func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
//        print("finish to load")
//        activityIndicator.isHidden = true
//        activityIndicator.stopAnimating()
//    }
}

