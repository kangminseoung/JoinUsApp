//
//  SuccessViewController.swift
//  JoinUsApp
//
//  Created by 강민성 on 3/13/25.
//

import UIKit

// MARK: - 로그인 성공 화면 Controller
class SuccessViewController: UIViewController {
    private let successView = SuccessView()
    private let userEmail: String
    
    init(userEmail: String) {
        self.userEmail = userEmail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = successView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = CoreDataManager.shared.getUser(email: userEmail) {
            successView.welcomeLabel.text = "\(user.nickname ?? "") 님 환영합니다!"
        }
        successView.logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        successView.deleteButton.addTarget(self, action: #selector(deleteAccountTapped), for: .touchUpInside)
    }
    
    @objc private func logoutButtonTapped() {
        UserDefaults.standard.removeObject(forKey: "loggedInUser")
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func deleteAccountTapped() {
        CoreDataManager.shared.deleteUser(email: userEmail)
        navigationController?.popToRootViewController(animated: true)
    }
}
