//
//  WeatherTableViewCell.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 11/7/23.
//

import UIKit

import SnapKit
import Then

class WeatherTableViewCell: UITableViewCell {
    
    static let identifier: String = "WeatherTableViewCell"
    
    private let backgroundImageView = UIImageView()
    private let locationTitleLabel = UILabel()
    private let locationLabel = UILabel()
    private let currentWeatherLabel = UILabel()
    private let currentTemperatureLabel = UILabel()
    private let highTemperatureLabel = UILabel()
    private let lowTemperatureLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        hieararchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.do {
            $0.backgroundColor = .black
        }
        
        backgroundImageView.do {
            $0.image = Image.weatherListBackground
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 16
            $0.clipsToBounds = true
        }
        
        locationTitleLabel.do {
            $0.text = "나의 위치"
            $0.font = .bold(size: 24)
            $0.textColor = .white
        }
        
        locationLabel.do {
            $0.text = "의정부시"
            $0.font = .medium(size: 17)
            $0.textColor = .white
        }
        
        currentWeatherLabel.do {
            $0.text = "흐림"
            $0.font = .medium(size: 16)
            $0.textColor = .white
        }
        
        currentTemperatureLabel.do {
            $0.text = "21°"
            $0.font = .light(size: 52)
            $0.textColor = .white
        }
        
        highTemperatureLabel.do {
            $0.text = "최고:29°"
            $0.font = .medium(size: 15)
            $0.textColor = .white
        }
        
        lowTemperatureLabel.do {
            $0.text = "최저:15°"
            $0.font = .medium(size: 15)
            $0.textColor = .white
        }
    }
    
    func hieararchy() {
        contentView.addSubViews(backgroundImageView)
        
        backgroundImageView.addSubViews(locationTitleLabel,
                                        locationLabel,
                                        currentWeatherLabel,
                                        currentTemperatureLabel,
                                        highTemperatureLabel,
                                        lowTemperatureLabel)
    }
    
    func setLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview().inset(8)
        }
        
        locationTitleLabel.snp.makeConstraints {
            $0.top.equalTo(backgroundImageView.snp.top).offset(10)
            $0.leading.equalTo(backgroundImageView.snp.leading).offset(16)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(locationTitleLabel.snp.bottom).offset(2)
            $0.leading.equalTo(backgroundImageView.snp.leading).offset(16)
        }
        
        currentWeatherLabel.snp.makeConstraints {
            $0.bottom.equalTo(backgroundImageView.snp.bottom).inset(10)
            $0.leading.equalTo(backgroundImageView.snp.leading).offset(16)
        }
        
        currentTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(backgroundImageView.snp.top).offset(4)
            $0.trailing.equalTo(backgroundImageView.snp.trailing).inset(16)
        }
        
        lowTemperatureLabel.snp.makeConstraints {
            $0.bottom.equalTo(backgroundImageView.snp.bottom).inset(10)
            $0.trailing.equalTo(backgroundImageView.snp.trailing).inset(16)
        }
        
        highTemperatureLabel.snp.makeConstraints {
            $0.bottom.equalTo(backgroundImageView.snp.bottom).inset(10)
            $0.trailing.equalTo(lowTemperatureLabel.snp.leading).offset(-6)
        }
    }
    
    
    func bindData() {
        
    }
}
