//
//  PostController.swift
//  Continuum
//
//  Created by Deven Day on 10/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class PostController {
    static let shared = PostController()
    private init() {}
    
    //MARK: - SOT
    var posts: [Post] = []
    
    //MARK: - CRUD
    // Create
    func addComment(text: String, post: Post,
                    completion: (Result<Comment, PostError>) -> Void) {
        let comment = Comment(text: text, post: post)
        post.comments.append(comment)
    }
    
    func creatPostWith(photo: UIImage, caption: String,
                       completion: (Result<Post?, PostError>) -> Void) {
        let post = Post(photo: photo, caption: caption)
        posts.append(post)
    }
    
    
}//END OF CLASS
