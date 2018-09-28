//
//  PostListTableViewController.swift
//  Continuum
//
//  Created by Ivan Ramirez on 9/26/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var postSearchBar: UISearchBar!
    
    
    //contains an array of searchBaleRecords
    var resultsArray: [SearchableRecord]?
    
    //stores a bool value set to default
    var isSearching: Bool = false
    
    // MARK: LifeCyles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postSearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //settting results array equal to p...shared.posts
        resultsArray = PostController.shared.posts
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isSearching ? resultsArray?.count ?? 0:PostController.shared.posts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as?  PostTableViewCell
        
        let dataSource = isSearching ? resultsArray : PostController.shared.posts
        let post = dataSource?[indexPath.row]
        cell?.post = post as? Post
        return cell ?? UITableViewCell()
    }
    
    // MARK: - Navigation  toPostDetailVC
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostDetailVC" {
            let destinationVC = segue.destination as? PostDetailTableViewController
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let post = PostController.shared.posts[indexPath.row]
            destinationVC?.post = post
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let posts = PostController.shared.posts
        //Within the function filter the posts using the Post object's matches(searchTerm: String) function and setting the resultsArray equal to the results of the filter
        let filteredPosts = posts.filter { $0.matches(searchTerm: searchText) }.compactMap {$0 as SearchableRecord}
        resultsArray = filteredPosts
        tableView.reloadData()
    }
    //This will return the feed back to its normal state of displaying all posts when the user cancels a search.
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        resultsArray = PostController.shared.posts
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
}

