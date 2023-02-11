//
//  DeclarationViewController.swift
//  AKOR
//
//  Created by Hakan Or on 11.02.2023.
//

import UIKit

class DeclarationViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var nationalIdTextField = UITextField()
    private lazy var createButton = UIButton()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        nationalIdTextField.translatesAutoresizingMaskIntoConstraints = false
        createButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nationalIdTextField)
        view.addSubview(createButton)
        nationalIdTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nationalIdTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nationalIdTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        nationalIdTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nationalIdTextField.backgroundColor = .systemBlue
        
        createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        createButton.topAnchor.constraint(equalTo: nationalIdTextField.bottomAnchor, constant: 16).isActive = true
        createButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        createButton.backgroundColor = .systemBlue
        createButton.addTarget(self, action: #selector(createButtonDidTap), for: .touchUpInside)
        
    }
    
    // MARK: - User Actions
    @objc func createButtonDidTap() {
        print(nationalIdTextField.text)
    }

}

