//
//  BaseViewController.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 9/4/24.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }

    func nextScreen(ctrl: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(ctrl, animated: animated)
    }

    func backScreen() {
        navigationController?.popViewController(animated: true)
    }

    func backToRootScreen() {
        navigationController?.popToRootViewController(animated: true)
    }

    func popToViewController(ofClass: AnyClass, animated _: Bool = true) {
        guard let viewControllers = navigationController?.viewControllers else { return }
        if let vc = viewControllers.first(where: { $0.isKind(of: ofClass) }) {
            navigationController?.popToViewController(vc, animated: true)
        }
    }

    @objc func dismissScreen(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }

    func showScreen(ctrl: UIViewController, fullScreen: Bool? = true, animated: Bool = true) {
        if fullScreen == true {
            ctrl.modalPresentationStyle = .overCurrentContext
            ctrl.modalTransitionStyle = .crossDissolve
        } else {
            ctrl.modalTransitionStyle = .coverVertical
        }
        if tabBarController != nil {
            tabBarController?.present(ctrl, animated: animated)
        } else {
            present(ctrl, animated: animated)
        }
    }
}
