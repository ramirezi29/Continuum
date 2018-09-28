//
//  PhotoSelectViewController.swift
//  Continuum
//
//  Created by Ivan Ramirez on 9/27/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

protocol PhotoSelectViewControllerDelegate: class  {
    func photoSelected(_ photo: UIImage)
}

class PhotoSelectViewController: UIViewController {
    @IBOutlet weak var selectPhotoButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    
    //needed for segue from AddPostTableVC
    weak var delegate: PhotoSelectViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //reset the Select Image Button's title back to "Select Image" and reset the imageView's image to nil.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        selectPhotoButton.setTitle("Select a Photo", for: .normal)
        photoImageView.image = nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func selectPhotoButtonTapped(_ sender: Any) {
    }
    
}
