//
//  PhotoSelectorViewController.swift
//  Continuum
//
//  Created by Deven Day on 10/7/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

protocol PhotoSelectorViewControllerDelegate: AnyObject {
    func didSelectImage(image: UIImage)
}

class PhotoSelectorViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var selectPhotoButton: UIButton!
    
    weak var delegate: PhotoSelectorViewControllerDelegate?
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        clearViews()
    }
    
    private func clearViews() {
        postImageView.image = nil
        selectPhotoButton.setTitle("Select Photo", for: .normal)
    }
    
    //MARK: - Actions
    @IBAction func selectPhotoButtonTapped(_ sender: Any) {
        presentImagePicker()
    }
}//END OF CLASS

//MARK: - Extensions
extension PhotoSelectorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            postImageView.image = image
            selectPhotoButton.setTitle("", for: .normal)
            delegate?.didSelectImage(image: image)
            
        } else {
            clearViews()
        }
        picker.dismiss(animated: true, completion: nil)
        print("User selected image")
    }
    
    func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
}//END OF EXTENSION
