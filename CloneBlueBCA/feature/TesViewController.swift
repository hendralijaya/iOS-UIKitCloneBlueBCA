//
//  TesViewController.swift
//  CloneBlueBCA
//
//  Created by hendra on 02/12/24.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

class TesViewController: UIViewController {

    let customBackButton: UIButton = {
        let button = UIButton(type: .system)
        let chevronImage = UIImage(systemName: "chevron.left")?
            .resized(to: CGSize(width: 12, height: 12))?
            .withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(chevronImage, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let startLabel: UILabel = {
        let label = UILabel()
        label.text = "Oke, kita mulai.."
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let instructionPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Masukkan no. handphone kamu"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let floatingTextField = FloatingLabelTextField(placeholder: "No. Handphone")

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Lanjut", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        layoutView()
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(customBackButton)
        view.addSubview(startLabel)
        view.addSubview(instructionPhoneNumberLabel)
        view.addSubview(floatingTextField)
        view.addSubview(nextButton)

        customBackButton.addTarget(self, action: #selector(customBackButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        floatingTextField.textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }

    private func layoutView() {
        NSLayoutConstraint.activate([
            customBackButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            customBackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            customBackButton.widthAnchor.constraint(equalToConstant: 40),
            customBackButton.heightAnchor.constraint(equalToConstant: 40),
            
            startLabel.topAnchor.constraint(equalTo: customBackButton.bottomAnchor, constant: 32),
            startLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            startLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            instructionPhoneNumberLabel.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 16),
            instructionPhoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            instructionPhoneNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            floatingTextField.textField.topAnchor.constraint(equalTo: instructionPhoneNumberLabel.bottomAnchor, constant: 32),
            floatingTextField.textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            floatingTextField.textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            floatingTextField.heightAnchor.constraint(equalToConstant: 60),
            
            nextButton.topAnchor.constraint(equalTo: floatingTextField.textField.bottomAnchor, constant: 32),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func customBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonPressed() {
        let nextViewController = IdentityCardViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    @objc private func textFieldChanged() {

        print("Text changed to: \(floatingTextField.textField.text?.replacingOccurrences(of: " ", with: "") ?? "nill ")")
        if let text = floatingTextField.textField.text, !text.isEmpty {
            nextButton.isEnabled = true
            nextButton.backgroundColor = .blue
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = .gray
        }
    }
}
