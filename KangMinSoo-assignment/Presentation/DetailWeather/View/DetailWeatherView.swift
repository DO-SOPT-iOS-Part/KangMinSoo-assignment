//
//  DetailWeatherView.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 11/7/23.
//

import UIKit

import SnapKit
import Then

class DetailWeatherView: UIView {
    
    private let backgroundImageView = UIImageView()
    private let verticalScrollView = UIScrollView()
    private var verticalContentView = UIView()
    private let detailWeatherTopView = DetailWeatherTopView()
    let detailWeatherBoxView = DetailWeatherBoxView()
    let detailWeatherBottomView = DetailWeatherBottomView()
    
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
        
        backgroundImageView.do {
            $0.image = Image.detailBackground
            $0.contentMode = .scaleAspectFill
        }
        
        verticalScrollView.do {
            $0.showsVerticalScrollIndicator = false
            $0.alwaysBounceVertical = true
        }
        
    }
    
    func hieararchy() {
        addSubViews(backgroundImageView,
                    verticalScrollView,
                    detailWeatherBottomView)
        
        verticalScrollView.addSubview(verticalContentView)
        verticalContentView.addSubViews(detailWeatherTopView,
                                        detailWeatherBoxView)
    }
    
    
    func setLayout() {
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        verticalScrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(detailWeatherBottomView.snp.top)
        }
        
        verticalContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(Size.width)
        }
        
        detailWeatherTopView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(34)
            $0.width.equalTo(Size.width)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(222)
        }
        
        detailWeatherBoxView.snp.makeConstraints {
            $0.top.equalTo(detailWeatherTopView.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(212)
            $0.width.equalTo(Size.width - 40)
        }
        
        detailWeatherBottomView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(62)
        }
    }
    
}

