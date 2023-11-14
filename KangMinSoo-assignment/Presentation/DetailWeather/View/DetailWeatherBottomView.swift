//
//  DetailWeatherBottomView.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 11/8/23.
//

import UIKit

import SnapKit
import Then

class DetailWeatherBottomView: UIView {
    
    private let bottomlineView = UIView()
    let mapButton = UIButton()
    let listButton = UIButton()
    let loctionButton = UIButton()
    let circleButton = UIButton()
    
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
        
        bottomlineView.do {
            $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        }
        
        mapButton.do {
            $0.setImage(Image.map, for: .normal)
            $0.tintColor = .white
        }
        
        listButton.do {
            $0.setImage(Image.listBullet, for: .normal)
            $0.tintColor = .white
        }
        loctionButton.do {
            $0.setImage(Image.locationFill, for: .normal)
            $0.tintColor = .white
        }
        circleButton.do {
            $0.setImage(Image.circleFill, for: .normal)
            $0.tintColor = .white
        }
    }
    
    func hieararchy() {
        addSubViews(bottomlineView,
                    mapButton,
                    listButton,
                    loctionButton,
                    circleButton)
    }
    
    func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(62)
        }
        
        mapButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().offset(10)
            $0.size.equalTo(44)
        }
        
        listButton.snp.makeConstraints {
            $0.centerY.equalTo(mapButton.snp.centerY)
            $0.trailing.equalToSuperview().inset(10)
            $0.size.equalTo(44)
        }
        
        loctionButton.snp.makeConstraints {
            $0.trailing.equalTo(self.snp.centerX).offset(-4)
            $0.centerY.equalTo(mapButton.snp.centerY)
            $0.size.equalTo(11)
        }
        
        circleButton.snp.makeConstraints {
            $0.leading.equalTo(self.snp.centerX).offset(4)
            $0.centerY.equalTo(mapButton.snp.centerY)
            $0.size.equalTo(11)
        }
        
        bottomlineView.snp.makeConstraints {
            $0.bottom.equalTo(mapButton.snp.top).offset(-8)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
}



