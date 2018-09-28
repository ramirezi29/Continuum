//
//  Post.swift
//  Continuum
//
//  Created by Ivan Ramirez on 9/26/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit
import CloudKit

class Post {
    
    let recordTypeKey = "Post"
    fileprivate let captionKey = "caption"
    fileprivate let timeStampKey = "timeStamp"
    fileprivate let photoDataKey = "photoData"
    
    
    var recordID = CKRecord.ID(recordName: UUID().uuidString)
    var photoData: Data?
    var timeStamp: Date
    var caption: String
    var comments: [Comment] = []
    var tempURL: URL?
    
    init(photo: UIImage, timeStamp: Date = Date(), caption: String, comments: [Comment] = [] ){
        self.comments = comments
        self.timeStamp = timeStamp
        self.caption = caption
        self.photo = photo
    }
    
    var photo: UIImage?{
        get{
            guard let photoData = photoData else {return nil}
            return UIImage(data: photoData)
        }
        set{
            photoData = newValue?.jpegData(compressionQuality: 0.6)
        }
    }
    
    
    
}
// protocol function: Return true if any of the Post commentsmatch, otherwise return false.
extension Post: SearchableRecord{
    func matches(searchTerm: String) -> Bool {
        if caption.lowercased().contains(searchTerm.lowercased()){
            return true
        }
        for comment in self.comments{
            if comment.matches(searchTerm: searchTerm){
                return true
            }
        }
        return false
    }
}

