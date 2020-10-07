//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by Deven Day on 10/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var postPhotoImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    //MARK: - Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Methods
    func updateViews() {
        postPhotoImageView.image = post?.photo
        captionLabel.text = post?.caption
        commentLabel.text = "Comments: \(post?.comments.count ?? 0)"
    }
}//END OF CLASS
