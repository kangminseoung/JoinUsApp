//
//  StartViewController.swift
//  JoinUsApp
//
//  Created by 강민성 on 3/13/25.
//
import UIKit

// MARK: - 시작하기 화면 Controller
class StartViewController: UIViewController {
    private let startView = StartView()
    
    override func loadView() {
        view = startView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startView.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc private func startButtonTapped() {
        if let email = UserDefaults.standard.string(forKey: "loggedInUser"),
           CoreDataManager.shared.getUser(email: email) != nil {
            let successVC = SuccessViewController(userEmail: email)
            navigationController?.pushViewController(successVC, animated: true)
        } else {
            let signUpVC = SignUpViewController()
            navigationController?.pushViewController(signUpVC, animated: true)
        }
    }
}
