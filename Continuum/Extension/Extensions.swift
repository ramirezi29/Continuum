//
//  Extensions.swift
//  Continuum
//
//  Created by Ivan Ramirez on 9/26/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//


import UIKit
//NOTE: need to include UIKit 


// MARK: - UIViewController

extension UIViewController {
    //going to have a message and a title
    func showAlertMessage(titleStr:String, messageStr:String) {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
