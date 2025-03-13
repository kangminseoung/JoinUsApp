//
//  SuccessView.swift
//  JoinUsApp
//
//  Created by 강민성 on 3/13/25.
//

import UIKit
import SnapKit

// 로그인 성공 화면 View
class SuccessView: UIView {
    let welcomeLabel = UILabel()
    let logoutButton = UIButton(type: .system)
    let deleteButton = UIButton(type: .system) // 회원탈퇴 버튼 추가

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        welcomeLabel.text = "환영합니다!"
        welcomeLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        welcomeLabel.textAlignment = .center

        logoutButton.setTitle("로그아웃", for: .normal)
        logoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        deleteButton.setTitle("회원탈퇴", for: .normal) // 버튼 추가
        deleteButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        deleteButton.setTitleColor(.red, for: .normal) // 회원탈퇴 버튼 강조

        let stackView = UIStackView(arrangedSubviews: [welcomeLabel, logoutButton, deleteButton])
        stackView.axis = .vertical
        stackView.spacing = 20

        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
