//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by Deven Day on 10/6/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    //MARK: - Properties
    var post: Post? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Methods
    func updateViews() {
        photoImageView.image = post?.photo
        tableView.reloadData()
    }
    
    func presentCommentAlertController() {
        let alertController = UIAlertController(title: "Add a Comment", message: "This app is anonymous. Have at it", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Your witty comment here"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let commentAction = UIAlertAction(title: "Comment", style: .default) { [weak self] (_) in
            guard let commentText = alertController.textFields?.first?.text, !commentText.isEmpty,
                  let post = self?.post else {return}
            PostController.shared.addComment(text: commentText, post: post,
                                             completion: { [weak self] (comment) in
                                                self?.tableView.reloadData()
                                             })
        }
        alertController.addAction(cancelAction)
        alertController.addAction(commentAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Actions
    @IBAction func commentButtonTapped(_ sender: Any) {
        presentCommentAlertController()
    }
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    @IBAction func followButtonTapped(_ sender: Any) {
    }
    
    
    
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments.count ?? 0
    }
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        let comment = post?.comments[indexPath.row]
        cell.textLabel?.text = comment?.text
//        cell.detailTextLabel?.text = comment?.timeStamp.stringWith(dataStyle: .medium, timeStyle: .short)
     
     return cell
     }
}//END OF CLASS
