//
//  DetailViewController.swift
//  HackingWithSwift
//
//  Created by Karina ❦ on 09.02.2024.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteButton: UIButton!
    
    var selectedImage: String?
    var quote: String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shared))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
            title = selectedImage
        }
    }
    
    @objc func shared() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        guard let message = quote else {
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, message], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    @IBAction func showQuote(_ sender: Any) {
        guard let message = quote else {
            return
        }
        
        let alert = UIAlertController(title: "Цитата", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default))
        
        present(alert, animated: true)
    }
}
