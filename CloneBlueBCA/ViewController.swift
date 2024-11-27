//
//  ViewController.swift
//  CloneBlueBCA
//
//  Created by hendra on 27/11/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "blu"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    let ctaActionLabel: UILabel = {
        let label = UILabel()
        label.text = "Mulai Langkahmu Bareng blu!"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let descriptionCtaLabel: UILabel = {
        let label = UILabel()
        label.text = "untuk hidup lebih mudah dan terkoneksi, apapun tujuanmu"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fill
        return stackView
    }()
    
    let carouselImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let startButton: BluButton = {
        let button = BluButton()
        button.setLabelText("Yuk Mulai!")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //scrollview to enable horizontal scrolling
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemCyan
        
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(imageView)
        
        contentStackView.addArrangedSubview(ctaActionLabel)
        contentStackView.addArrangedSubview(descriptionCtaLabel)
        contentStackView.addArrangedSubview(carouselImageView)
        contentStackView.addArrangedSubview(startButton)
        
        
        let stackView = UIStackView(arrangedSubviews: [headerStackView, contentStackView])
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            carouselImageView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            carouselImageView.heightAnchor.constraint(equalTo: carouselImageView.widthAnchor)
        ])
        
        ctaActionLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        descriptionCtaLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc private func startButtonTapped() {
        print("BluButton clicked! Perform your action here.")
    }
}

struct ViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // Update the UIViewController (if needed)
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview()
            .ignoresSafeArea()
    }
}
