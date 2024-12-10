//import UIKit
//import SwiftUI
//
//class ViewController: UIViewController {
//    
//    let carouselVC = CarouselOpeningViewController()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .systemCyan
//        
//        // Add headerStackView
//        headerStackView.addArrangedSubview(titleLabel)
//        headerStackView.addArrangedSubview(imageView)
//        view.addSubview(headerStackView)
//        
//        // Add carouselVC
//        addChild(carouselVC)
//        guard let carouselView = carouselVC.view else {
//            print("Error: carouselVC.view is nil")
//            return
//        }
//        carouselView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(carouselView)
//        carouselVC.didMove(toParent: self)
//        
//        // Add startButton
//        view.addSubview(startButton)
//        
//        // Apply constraints
//        NSLayoutConstraint.activate([
//            // Header stack view constraints
//            imageView.widthAnchor.constraint(equalToConstant: 40),
//            imageView.heightAnchor.constraint(equalToConstant: 40),
//            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            
//            // Carousel view constraints
//            carouselView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            carouselView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            carouselView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 16),
//            carouselView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
//            
//            // Start button constraints
//            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            startButton.topAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: 32),
//            startButton.heightAnchor.constraint(equalToConstant: 50) // Button height
//        ])
//        
//        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
//    }
//    
//    @objc private func startButtonTapped() {
//        print("BluButton clicked! Perform your action here.")
//    }
//}
