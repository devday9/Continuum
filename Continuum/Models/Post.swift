//
//  Post.swift
//  Continuum
//
//  Created by Deven Day on 10/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class Post {
    var photoData: Data?
    var timeStamp: Date
    var caption: String
    var comments: [Comment]
    var photo: UIImage? {
        get {
            guard let photoData = photoData else {return nil}
            return UIImage(data: photoData)
        }
        set {
            photoData = newValue?.jpegData(compressionQuality: 0.5)
        }
    }
    
    init(photo: UIImage, caption: String, timeStamp: Date = Date(), comments: [Comment] = []) {
         self.caption = caption
         self.timeStamp = timeStamp
         self.comments = comments
         self.photo = photo
         }
}//END OF CLASS

extension Post: SearchableRecord {
    func matches(searchTerm: String) -> Bool {
        return caption.lowercased().contains(searchTerm.lowercased())
    }
}
