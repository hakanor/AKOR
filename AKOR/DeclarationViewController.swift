//
//  DeclarationViewController.swift
//  AKOR
//
//  Created by Hakan Or on 11.02.2023.
//

import UIKit

class DeclarationViewController: UIViewController {
    
    // MARK: - Subviews
    private lazy var nationalIdTextField = createTextField(placeholder: "National ID")
    private lazy var nameTextField = createTextField(placeholder: "Name")
    private lazy var surnameTextField = createTextField(placeholder: "Surname")
    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(createButtonDidTap), for: .touchUpInside)
        return button
    }()
    private lazy var formStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()

    // MARK: - Properties
    private let declarationService = DeclarationService()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        declarationService.delegate = self
        setupViews()
    }
    
    // MARK: - User Actions
    @objc func createButtonDidTap() {
        declarationService.createDeclaration(nationalId: nationalIdTextField.text)
    }
}

// MARK: - Delegates
extension DeclarationViewController: DeclarationServiceDelegate {
    func declarationCreated() {
        print("Created")
    }
    
    func declarationFailed() {
        print("Failed")
    }
}

// MARK: - Subview Factory
extension DeclarationViewController {
    private func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.backgroundColor = .white
        textField.textColor = .darkText
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = placeholder
        textField.layer.cornerRadius = 8
        return textField
    }
}

// MARK: - Setup
extension DeclarationViewController {
    private func setupViews() {
        view.addSubview(formStackView)
        formStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        formStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        formStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        
        [nationalIdTextField, nameTextField, surnameTextField, createButton].forEach { subview in
            formStackView.addArrangedSubview(subview)
            subview.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
}
