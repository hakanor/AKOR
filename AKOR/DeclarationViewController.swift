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

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        nationalIdTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nationalIdTextField)
        nationalIdTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nationalIdTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nationalIdTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        nationalIdTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nationalIdTextField.backgroundColor = .systemBlue
        // Do any additional setup after loading the view.
    }


}

