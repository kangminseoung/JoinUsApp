//
//  CoreDataManager.swift
//  JoinUsApp
//
//  Created by 강민성 on 3/13/25.
//

import UIKit
import SnapKit

// 시작하기 화면 View
class StartView: UIView {
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(.black, for: .normal) // 명확한 색상 지정
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = .blue
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white // 배경색 설정
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(44) // 기본 버튼 높이
            make.leading.trailing.equalToSuperview().inset(50) // 가로 중앙 정렬
        }
    }
}

