//
//  SignUpViewController.swift
//  JoinUsApp
//
//  Created by 강민성 on 3/13/25.
//

import UIKit

// MARK: - 회원가입 화면 Controller
class SignUpViewController: UIViewController {
    private let signUpView = SignUpView()
    
    override func loadView() {
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc private func signUpButtonTapped() {
        guard let email = signUpView.emailTextField.text,
              let password = signUpView.passwordTextField.text,
              let confirmPassword = signUpView.confirmPasswordTextField.text,
              let nickname = signUpView.nicknameTextField.text else { return }
        
        if !isValidEmail(email) {
            print("유효하지 않은 이메일 형식")
            return
        }
        
        if !isValidPassword(password) {
            print("비밀번호는 최소 8자 이상이며, 영문자와 숫자를 포함해야 합니다.")
            return
        }
        
        if password != confirmPassword {
            print("비밀번호 불일치")
            return
        }
        
        if CoreDataManager.shared.saveUser(email: email, password: password, nickname: nickname) {
            let successVC = SuccessViewController(userEmail: email)
            navigationController?.pushViewController(successVC, animated: true)
        } else {
            print("이미 존재하는 이메일")
        }
    }
}
