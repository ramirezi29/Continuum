//
//  PostController.swift
//  Continuum
//
//  Created by Ivan Ramirez on 9/26/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import Foundation

class PostController {
    
    //MARK: Singleton
    static let shared = PostController()
    
    private init() {}
    
    var posts = [Post]()
    
    
    //MARK: Create
    
    //MARK: Add Comment
    //parameters: text as string and a Post parameter. return a Comment object in a completion clousure
    func addComment(_ text: String, to post: Post, completion: @escaping (Comment?) ->()){
        //create what a comment should look like
      let comment =  Comment(text: text, post: post)
        //
      post.comments.append(comment)
    }
}
