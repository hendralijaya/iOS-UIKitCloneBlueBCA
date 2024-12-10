//
//  IdentityCardViewController.swift
//  CloneBlueBCA
//
//  Created by hendra on 10/12/24.
//

import UIKit
import VisionKit

class IdentityCardViewController: UIViewController, VNDocumentCameraViewControllerDelegate {

    var scannedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        DispatchQueue.main.async {
            self.openDocumentScanner()
        }
    }

    @objc private func openDocumentScanner() {
        guard VNDocumentCameraViewController.isSupported else {
            print("Document scanning is not supported on this device.")
            showAlert(title: "Unsupported", message: "This device does not support document scanning.")
            return
        }
        
        let documentCameraViewController = VNDocumentCameraViewController()
        documentCameraViewController.delegate = self
        present(documentCameraViewController, animated: true, completion: nil)
    }

    // MARK: - VNDocumentCameraViewControllerDelegate

    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        if scan.pageCount > 0 {
            let firstImage = scan.imageOfPage(at: 0)
            scannedImage = firstImage
            
            DispatchQueue.main.async {
                controller.dismiss(animated: true) {
                    self.showNextViewController()
                }
            }
            print("Scan successful. Image captured.")
        } else {
            DispatchQueue.main.async {
                controller.dismiss(animated: true) {
                    self.showAlert(title: "Scan Failed", message: "No pages were scanned.")
                }
            }
            print("Scan completed but no pages were captured.")
        }
    }

    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }

    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        controller.dismiss(animated: true, completion: nil)
        print("Document scanning failed with error: \(error.localizedDescription)")
        showAlert(title: "Error", message: "Failed to scan the document.")
    }

    // MARK: - Navigation

    private func showNextViewController() {
        guard let scannedImage = scannedImage else { return }

        let nextViewController = ScannedImageViewController()
        nextViewController.scannedImage = scannedImage
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
