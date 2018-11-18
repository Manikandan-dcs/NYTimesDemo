//
//  MasterViewController.swift
//  MasterDetailDemo
//
//  Created by Manikandan Sundararajan on 17/11/18.
//  Copyright © 2018 Manikandan Sundararajan. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var articleModel = Article()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tableViewSetup()
        
        self.navigationItem.title = NavigationTitle.mostPopularArticle
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        getNYTimesArticlesList()
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
            if let indexPath = sender as? IndexPath {
                controller.detail = articleModel.results[indexPath.row]
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
    //MARK: - API
    func getNYTimesArticlesList()
    {
        // here we are initializing the URL Struct with the path which we want to access from the API
        guard let url = URL(string: APIConstants.article_URL) else { return }
        let urlSession = URLSession.shared
        let getRequest = URLRequest(url: url)
        let task = urlSession.dataTask(with: getRequest as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                
                // the data is returned in JSON format and needs to be converted into something that swift can work with
                // we are converting it into a dictionary of type [String: Any]
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    self.articleModel = Article(dict: json)
                    self.updateUI()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        
        task.resume()
    }

    func updateUI()
    {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableViewSetup()
    {
        tableView.register(UINib(nibName: "ArticleListCell", bundle: nil), forCellReuseIdentifier: "list")

        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleModel.results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellConstants.Identifier.articleList, for: indexPath) as! ArticleListCell
        cell.initCell()
        
        let item = articleModel.results[indexPath.row]
        cell.titleLbl.text = item.title
        cell.byLineLbl.text = item.byLine.uppercased()
        cell.sectionLbl.text = item.section.uppercased()
        cell.dateLbl.text = item.publishedDate
        
        if !item.mediaURL.isEmpty {
            let imageUrl:URL = URL(string: item.mediaURL)!
            
            // Start background thread so that image loading does not make app unresponsive
            DispatchQueue.global(qos: .userInitiated).async {
                
                if let imageData:NSData = NSData(contentsOf: imageUrl) {
                // When from background thread, UI needs to be updated on main_queue
                    DispatchQueue.main.async {
                        let image = UIImage(data: imageData as Data)
                        cell.imgView.image = image
                    }
                }
            }
        }
        
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .blue
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return UITableView.automaticDimension
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "showDetail", sender: indexPath)
    }
    
}

