//
//  TenDayWeatherTableViewCell.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 11/10/23.
//

import UIKit

import SnapKit
import Then

class TenDayWeatherTableViewCell: UITableViewCell {

    static let identifier: String = "TenDayWeatherTableViewCell"
    
    private let dayLabel = UILabel()
    private let weatherImageView = UIImageView()
    private let rainyPercentLabel = UILabel()
    private let lowTemperatureLabel = UILabel()
    private let gradeintImageView = UIImageView()
    private let highTemperatureLabel = UILabel()
    private let stackView = UIStackView()
    
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
            $0.backgroundColor = .clear
            $0.layoutMargins = UIEdgeInsets.zero
        }
        
        dayLabel.do {
            $0.text = "오늘"
            $0.font = .medium(size: 22)
            $0.textColor = .white
        }
        
        weatherImageView.do {
            $0.image = Image.cloudRainFill
        }
        
        rainyPercentLabel.do {
            $0.text = "60%"
            $0.font = .medium(size: 15)
            $0.textColor = UIColor(red: 0.506, green: 0.812, blue: 0.98, alpha: 1)
        }
        
        lowTemperatureLabel.do {
            $0.text = "15°"
            $0.font = .medium(size: 22)
            $0.textColor = .systemGray
        }
        
        gradeintImageView.do {
            $0.image = Image.frame
        }
        
        highTemperatureLabel.do {
            $0.text = "22°"
            $0.font = .medium(size: 22)
            $0.textColor = .white
        }
        
        stackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalCentering
            $0.alignment = .center
        }
    }
    
    func hieararchy() {
        contentView.addSubViews(dayLabel,
                                weatherImageView,
                                rainyPercentLabel,
                                stackView)
        stackView.addArrangeSubViews(lowTemperatureLabel,
                                     gradeintImageView,
                                     highTemperatureLabel)
    }
    
    func setLayout() {
        self.contentView.snp.makeConstraints {
            $0.height.equalTo(55)
            $0.edges.equalToSuperview().inset(UIEdgeInsets.zero)
        }
        
        dayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(87)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(26)
        }
        
        if rainyPercentLabel.text != nil {
            weatherImageView.snp.updateConstraints {
                $0.centerY.equalToSuperview().offset(-7)
            }
        }
        
        rainyPercentLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(0.85)
            $0.centerX.equalTo(weatherImageView.snp.centerX)
        }
        
        gradeintImageView.snp.makeConstraints{
            $0.width.equalTo(108)
            $0.height.equalTo(12)
        }
        
        stackView.snp.makeConstraints{
            $0.leading.equalTo(weatherImageView.snp.trailing).offset(15)
            $0.trailing.equalToSuperview().inset(15)
            $0.top.bottom.equalToSuperview()
        }
    }
    
    func bindData() {
        
    }
}
