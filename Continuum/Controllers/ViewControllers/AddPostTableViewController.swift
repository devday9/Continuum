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
    @IBOutlet weak var captionTextField: UITextField!
    
    var selectedImage: UIImage?
    
    //MARK: - Lifecycle
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        captionTextField.text = nil
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImagePicController" {
            guard let selectImageVC = segue.destination as? PhotoSelectorViewController else {return}
            selectImageVC.delegate = self
        }
    }
    
    // MARK: - Actions
    @IBAction func addPostButtonTapped(_ sender: Any) {
        guard let photo = selectedImage,
              let caption = captionTextField.text else {return}
        PostController.shared.creatPostWith(photo: photo, caption: caption) { (post) in
        }
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
}//END OF CLASS

//MARK: - Extension
extension AddPostTableViewController: PhotoSelectorViewControllerDelegate {
    func didSelectImage(image: UIImage) {
        selectedImage = image
    }
}//END OF EXTENSION
