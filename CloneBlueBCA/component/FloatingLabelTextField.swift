//
//  FloatingLabelTextField.swift
//  CloneBlueBCA
//
//  Created by hendra on 10/12/24.
//

import UIKit

class FloatingLabelTextField: UIView, UITextFieldDelegate {

    private let floatingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = .lightGray
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        textField.addSubview(bottomLine)
        
        NSLayoutConstraint.activate([
            bottomLine.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            bottomLine.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        return textField
    }()

    private var floatingLabelTopConstraint: NSLayoutConstraint!

    init(placeholder: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        floatingLabel.text = placeholder
        setupView()
        setupActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(floatingLabel)
        addSubview(textField)

        floatingLabelTopConstraint = floatingLabel.centerYAnchor.constraint(equalTo: textField.centerYAnchor)
        
        NSLayoutConstraint.activate([
            floatingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            floatingLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            floatingLabelTopConstraint,
            
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

    private func setupActions() {
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
    }

    @objc private func textFieldEditingDidBegin() {
        animateFloatingLabel(isActive: true)
    }

    @objc private func textFieldEditingDidEnd() {
        if textField.text?.isEmpty == true {
            animateFloatingLabel(isActive: false)
        }
    }

    private func animateFloatingLabel(isActive: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.floatingLabelTopConstraint.constant = isActive ? -20 : 0
            self.floatingLabel.font = isActive
                ? UIFont.systemFont(ofSize: 14, weight: .regular)
                : UIFont.systemFont(ofSize: 16, weight: .regular)
            self.layoutIfNeeded()
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return true }
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        let numbersOnly = updatedText.replacingOccurrences(of: "\\D", with: "", options: .regularExpression)
        let limitedNumbers = String(numbersOnly.prefix(14))
        
        var formattedText = ""
        for (index, char) in limitedNumbers.enumerated() {
            if index == 4 || index == 8 { formattedText += " " }
            formattedText.append(char)
        }
        
        textField.text = formattedText
        textField.sendActions(for: .editingChanged)
        return false
    }
}
