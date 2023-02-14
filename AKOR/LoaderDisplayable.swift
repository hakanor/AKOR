//
//  LoaderDisplayable.swift
//  AKOR
//
//  Created by Hakan Or on 14.02.2023.
//

import UIKit

protocol LoaderDisplayable where Self: UIViewController {
    func showLoading()
    func dismissLoading()
}

extension LoaderDisplayable {
    func showLoading() {
        let child = SpinnerViewController()

        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func dismissLoading() {
        guard let child = children.last as? SpinnerViewController else { return }
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
