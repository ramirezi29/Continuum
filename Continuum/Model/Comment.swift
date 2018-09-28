//
//  Comment.swift
//  Continuum
//
//  Created by Ivan Ramirez on 9/26/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation
import CloudKit

class Comment {
    
    let typeKey = "Comment"
    fileprivate let textKey = "text"
    fileprivate let timeStampKey = "timeStampKey"
    fileprivate let postReferenceKey = "postReference"
    
    var recordID = CKRecord.ID(recordName: UUID().uuidString)
    var text: String
    var timeStamp: Date
    // weak in order to avoid retain cycle/memory leakage
    weak var post: Post?
    
    init(text: String, timeStamp: Date = Date(), post: Post?) {
        self.text = text
        self.timeStamp = timeStamp
        self.post = post
        
    }
    //when pulling from iCloud I want to convert the values to be read on the local device
    convenience required init?(record: CKRecord) {
        //failable init
        guard let text = record["text"] as? String,
        let timeStamp = record.creationDate else {return nil}
        //init
        self.init(text: text, timeStamp: timeStamp, post: nil)
        self.recordID = record.recordID
    }
}

extension CKRecord {
    convenience init(_ comment: Comment) {
        guard let post = comment.post else {
            fatalError("Comment does not have a post relationship")
        }
        self.init(recordType: comment.typeKey, recordID: comment.recordID)
        self.setValue(comment.text, forKey: comment.textKey)
        self.setValue(comment.timeStamp, forKey: comment.timeStampKey)
        self.setValue(CKRecord.Reference(recordID: post.recordID, action: .deleteSelf), forKey: comment.postReferenceKey)
    }
}

//Were calling a portocol's func we declared in a different file 
extension Comment: SearchableRecord {
    func matches(searchTerm: String) -> Bool {
        return self.text.lowercased().contains(searchTerm.lowercased())
    }
}
