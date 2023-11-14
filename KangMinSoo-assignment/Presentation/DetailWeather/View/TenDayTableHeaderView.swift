//
//  TenDayTableHeaderView.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 11/10/23.
//

import UIKit

import SnapKit
import Then

class TenDayTableHeaderView: UIView {
    
    private let titleImageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        hieararchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        titleImageView.do {
            $0.image = Image.calendar
        }
        
        titleLabel.do {
            $0.text = "10일간의 일기예보"
            $0.font = .medium(size: 15)
            $0.textColor = .lightGray
        }
    }
    
    func hieararchy() {
        addSubViews(titleImageView,
                    titleLabel)
    }
    
    func setLayout() {
        
        titleImageView.snp.makeConstraints {
            $0.size.equalTo(24)
            $0.leading.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleImageView.snp.trailing).offset(5)
            $0.centerY.equalToSuperview()
        }
        
    }
    
}
