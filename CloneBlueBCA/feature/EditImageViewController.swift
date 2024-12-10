//
//  EditImageViewController.swift
//  CloneBlueBCA
//
//  Created by hendra on 10/12/24.
//

import UIKit
import WeScan

class EditImageViewController: UIViewController {
    // Declare properties to hold the captured image and quadrilateral
    var captureImage: UIImage?
    var quad: Quadrilateral?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Display the captured image
        if let image = captureImage {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = view.bounds
            view.addSubview(imageView)
        }

        // Optionally, visualize the quadrilateral (if needed)
        if let quad = quad {
            print("Quadrilateral: \(quad)")
        }
    }
}
