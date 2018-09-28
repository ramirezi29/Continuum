//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by Ivan Ramirez on 9/26/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    @IBOutlet weak var DetailPhotoImageView: UIImageView!
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //row hights
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return post?.comments.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
let comment = post?.comments[indexPath.row]
        cell.textLabel?.text = comment?.text
        
        if let timeStamp = comment?.timeStamp{
            cell.detailTextLabel?.text = dateFormatter.string(for: timeStamp)
        }

        return cell
    }
    
    //update the image
    
    func updateViews(){
    guard let post = post else {return}
        DetailPhotoImageView.image = post.photo
    }
    
    func presentCommentAlertController(){
        
        let alertController = UIAlertController(title: "Leave a Comment", message: "OK", preferredStyle: .alert)
        
        alertController.addTextField { (commentTextField) in
            commentTextField.placeholder = "Your comment here"
        }
    }
    //the showAlertMessage was put in a seperate file
    @IBAction func commentButtonPressed(_ sender: Any) {
    presentCommentAlertController()
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    
    @IBAction func followButtonSmashed(_ sender: Any) {
    }
    
    
}
