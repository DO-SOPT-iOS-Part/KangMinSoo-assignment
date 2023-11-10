//
//  WeatherBoxCollectionViewCell.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 11/8/23.
//

import UIKit

import SnapKit
import Then

class WeatherBoxCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "WeatherBoxCollectionViewCell"
    
    private let timeLabel = UILabel()
    private let weatherImageView = UIImageView()
    private let weatherTemperatureLabel = UILabel()
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        hieararchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.do {
            $0.backgroundColor = .clear
        }
        
        timeLabel.do {
            $0.text = "Now"
            $0.font = .medium(size: 17)
            $0.textColor = .white
        }
        
        weatherImageView.do {
            $0.image = Image.sunMaxFill
        }
        
        weatherTemperatureLabel.do {
            $0.text = "21°"
            $0.font = .medium(size: 22)
            $0.textColor = .white
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.spacing = 4
            $0.alignment = .center
        }
    }
    
    func hieararchy() {
        
        contentView.addSubViews(timeLabel,
                                weatherImageView,
                                weatherTemperatureLabel)
    }
    
    func setLayout() {
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.centerX.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(44)
        }
        
        weatherTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
    }
    
    
    func bindData() {
        
    }
}
