//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Deven Day on 10/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var selectPhotoButton: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    
    //MARK: - Lifecycle
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        photoImageView.image = nil
        captionTextField.text = nil
        selectPhotoButton.setTitle("Select Photo", for: .normal)
    }

    // MARK: - Actions
    @IBAction func addPostButtonTapped(_ sender: Any) {
        guard let photo = photoImageView.image,
              let caption = captionTextField.text else {return}
        PostController.shared.creatPostWith(photo: photo, caption: caption) { (post) in
        }
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
}//END OF CLASS
