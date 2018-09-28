//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Ivan Ramirez on 9/26/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var insterCaptionTextField: UITextField!
    
    var photo: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UISTory)


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhotoSelectVC" {
            guard let destinationVC = segue.destination as? PhotoSelectViewController else {return}
            destinationVC.delegate = self
        }
    }
 
    @IBAction func cancelButtonTapped(_ sender: Any) {
//        bring the user back to the PostListTableViewController
        self.tabBarController?.selectedIndex = 0
    }
    
//check for an image and caption. If there is an image and a caption use the PostController to crate a new Post.
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let photo = photo, let caption = insterCaptionTextField.text, !caption.isEmpty else {return}
        //want to navigate the user back to PostListTableViewController
    self.tabBarController?.selectedIndex = 0
}
}
