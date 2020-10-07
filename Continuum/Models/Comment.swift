//
//  Comment.swift
//  Continuum
//
//  Created by Deven Day on 10/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation

class Comment {
    let text: String
    let timeStamp: Date
    weak var post: Post?
    
    init(text: String, post: Post, timeStamp: Date = Date ()) {
        self.text = text
        self.post = post
        self.timeStamp = timeStamp
    }
}//END OF CLASS

extension Comment: SearchableRecord {
    func matches(searchTerm: String) -> Bool {
        return text.lowercased().contains(searchTerm.lowercased())
    }
}//END OF EXTENSION
