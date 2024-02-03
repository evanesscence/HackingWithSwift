//
//  DetailViewController.swift
//  HackingWithSwift
//
//  Created by Karina ❦ on 01.02.2024.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var totalPictures = 0
    var selectedPictureNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(selectedPictureNumber) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
