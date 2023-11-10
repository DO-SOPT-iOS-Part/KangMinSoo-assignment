//
//  DetailWeatherTopView.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 11/7/23.
//

import UIKit

import SnapKit
import Then

class DetailWeatherTopView: UIView {
    
    private let locationLabel = UILabel()
    private let currentTemperatureLabel = UILabel()
    private let currentWeatherLabel = UILabel()
    private let highLowTemperatureLabel = UILabel()
    private let stackView = UIStackView()
    
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
        
        locationLabel.do {
            $0.text = "의정부시"
            $0.font = .regular(size: 36)
            $0.textColor = .white
        }
        
        currentTemperatureLabel.do {
            $0.text = "21°"
            $0.font = .thin(size: 102)
            $0.textColor = .white
        }
        
        currentWeatherLabel.do {
            $0.text = "흐림"
            $0.font = .regular(size: 24)
            $0.textColor = .white
        }
        
        highLowTemperatureLabel.do {
            $0.text = "최고:29°  최저:15°"
            $0.font = .medium(size: 20)
            $0.textColor = .white
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.spacing = 4
            $0.alignment = .center
        }
    }
    
    func hieararchy() {
        addSubview(stackView)
        stackView.addArrangeSubViews(locationLabel,
                                     currentTemperatureLabel,
                                     currentWeatherLabel,
                                     highLowTemperatureLabel)
    }
    
    func setLayout() {
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
