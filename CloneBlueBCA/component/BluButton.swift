//
//  BluButton.swift
//  CloneBlueBCA
//
//  Created by hendra on 27/11/24.
//

import UIKit

class BluButton: UIButton {
    private let buttonLabel = UILabel()
    private let overlayView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 24
        self.layer.masksToBounds = true
        
        buttonLabel.textAlignment = .center
        buttonLabel.textColor = .black
        buttonLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        self.addSubview(buttonLabel)
        
        overlayView.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        overlayView.isHidden = true
        
        self.addSubview(overlayView)
        
        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func setLabelText(_ text: String) {
        buttonLabel.text = text
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width, height: 48)
    }
    
    override var isHighlighted: Bool {
        didSet {
            overlayView.isHidden = !isHighlighted
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        overlayView.frame = self.bounds
    }
}
