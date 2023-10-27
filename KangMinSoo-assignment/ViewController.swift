//
//  ViewController.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 10/14/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 36)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "날씨"
        label.numberOfLines = 1
        return label
    }()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        let attributedPlaceholder = NSAttributedString(
            string: "도시 또는 공항 검색",
            attributes: [
                .foregroundColor: UIColor.gray,
                .font: UIFont(name: "SFProDisplay-Regular", size: 19) ?? UIFont.systemFont(ofSize: 19)
            ]
        )
        
        textField.attributedPlaceholder = attributedPlaceholder
        
        textField.leftView = UIImageView(image: UIImage(systemName: "magnifyingglass")?.withTintColor(.gray, renderingMode: .alwaysOriginal))
        
        textField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        textField.layer.cornerRadius = 10
        
        textField.leftViewMode = .always
        textField.font = UIFont(name: "SFProDisplay-Regular", size: 19)
        textField.textColor = UIColor.white
        return textField
    }()
    
    private let weatherButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        let backgroundImage = UIImage(named: "buttonImage") // 배경 이미지 파일의 이름을 사용
        button.setBackgroundImage(backgroundImage, for: .normal)
        return button
    }()
    
    private let locationTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "나의 위치"
        label.numberOfLines = 1
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "의정부시"
        label.numberOfLines = 1
        return label
    }()
    
    private let currentWeatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "흐림"
        label.numberOfLines = 1
        return label
    }()
    
    private let currentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Light", size: 52)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "21°"
        label.numberOfLines = 1
        return label
    }()
    
    private let highTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 15)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "최고:29°"
        label.numberOfLines = 1
        return label
    }()
    
    private let lowTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 15)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "최저:15°"
        label.numberOfLines = 1
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        weatherButton.addTarget(self, action: #selector(weatherButtonTapped), for: .touchUpInside)
        setupNavigation()
        setupButtonLayout()
        setupLayout()
    }
    
    @objc func weatherButtonTapped() {
        navigationController?.pushViewController(DetailWeatherVC(), animated: true)
    }
    
    @objc func ellipsisButtonTapped() {
        print("ellipsisButton이 클릭되었습니다.")
    }
    
    func setupNavigation() {
        if let ellipsisImage = UIImage(systemName: "ellipsis.circle") {
            let whiteEllipsisImage = ellipsisImage.withTintColor(.white, renderingMode: .alwaysOriginal)
            
            let ellipsisButton = UIBarButtonItem(image: whiteEllipsisImage, style: .plain, target: self, action: #selector(ellipsisButtonTapped))
            
            navigationItem.rightBarButtonItem = ellipsisButton
        }
    }

    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            make.leading.equalTo(scrollView.contentLayoutGuide.snp.leading)
            make.trailing.equalTo(scrollView.contentLayoutGuide.snp.trailing)
            make.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
            make.width.equalTo(scrollView)
            make.height.greaterThanOrEqualTo(view).priority(.low)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.leading.equalTo(contentView.snp.leading).offset(20)
        }
        
        contentView.addSubview(searchTextField)
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        contentView.addSubview(weatherButton)
        weatherButton.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(117)
        }
    }

    func setupButtonLayout() {
        weatherButton.addSubview(locationTitleLabel)
        locationTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherButton.snp.top).offset(10)
            make.leading.equalTo(weatherButton.snp.leading).offset(16)
        }
        
        weatherButton.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(locationTitleLabel.snp.bottom).offset(2)
            make.leading.equalTo(weatherButton.snp.leading).offset(16)
        }
        
        weatherButton.addSubview(currentWeatherLabel)
        currentWeatherLabel.snp.makeConstraints { make in
            make.bottom.equalTo(weatherButton.snp.bottom).offset(-10)
            make.leading.equalTo(weatherButton.snp.leading).offset(16)
        }
        
        weatherButton.addSubview(currentTemperatureLabel)
        currentTemperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherButton.snp.top).offset(4)
            make.trailing.equalTo(weatherButton.snp.trailing).offset(-16)
        }
        
        weatherButton.addSubview(lowTemperatureLabel)
        lowTemperatureLabel.snp.makeConstraints { make in
            make.bottom.equalTo(weatherButton.snp.bottom).offset(-10)
            make.trailing.equalTo(weatherButton.snp.trailing).offset(-16)
        }
        
        weatherButton.addSubview(highTemperatureLabel)
        highTemperatureLabel.snp.makeConstraints { make in
            make.bottom.equalTo(weatherButton.snp.bottom).offset(-10)
            make.trailing.equalTo(lowTemperatureLabel.snp.leading).offset(-6)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
}
