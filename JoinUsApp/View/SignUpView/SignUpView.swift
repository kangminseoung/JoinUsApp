//
//  SignUpView.swift
//  JoinUsApp
//
//  Created by 강민성 on 3/13/25.
//

import UIKit
import SnapKit

// 회원가입 화면 View
class SignUpView: UIView {
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let confirmPasswordTextField = UITextField()
    let nicknameTextField = UITextField()
    let signUpButton = UIButton(type: .system)
    
    // 설명 라벨 추가
    private let emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일: 6~20자, 영문 소문자 및 숫자만 가능, 숫자로 시작 불가, @ 포함 필수"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    private let passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호: 최소 8자 이상, 영문자 및 숫자 포함 필수"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        emailTextField.placeholder = "이메일 입력"
        emailTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "비밀번호 입력"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.placeholder = "비밀번호 확인"
        confirmPasswordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.isSecureTextEntry = true
        nicknameTextField.placeholder = "닉네임 입력"
        nicknameTextField.borderStyle = .roundedRect
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        let stackView = UIStackView(arrangedSubviews: [
            emailTextField, emailInfoLabel,
            passwordTextField, passwordInfoLabel,
            confirmPasswordTextField, nicknameTextField, signUpButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
