//
//  FormTextField.swift
//  AKOR
//
//  Created by Hakan Or on 13.02.2023.
//

import UIKit

final class FormTextField: UITextField {
    private let formatter: Formatter?

    init(placeholder: String, formatter: Formatter? = nil) {
        self.formatter = formatter
        super.init(frame: .zero)
        setup(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(placeholder: String) {
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemBlue.cgColor
        backgroundColor = .white
        textColor = .darkText
        font = .systemFont(ofSize: 16)
        layer.cornerRadius = 8
        self.placeholder = placeholder
        addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text ?? ""
        textField.text = formatter?.format(text: text)
    }
}

