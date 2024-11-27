//
//  Slide.swift
//  CloneBlueBCA
//
//  Created by hendra on 27/11/24.
//

import UIKit

class Slide: UIView {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.font = .boldSystemFont(ofSize: 20)
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()
    
    lazy var descriptionLabel: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 16)
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        layoutViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.backgroundColor = UIColor.gray
    }
    
    private func layoutViews() {
        layoutImageView()
        layoutTitleLabel()
        layoutDescriptionLabel()
    }
    
    private func layoutImageView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 55),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 160),
            imageView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }

    private func layoutTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }

    private func layoutDescriptionLabel() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
