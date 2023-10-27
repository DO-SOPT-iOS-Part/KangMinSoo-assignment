//
//  DetailWeatherVC.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 10/27/23.
//

import UIKit
import SnapKit

class DetailWeatherVC: UIViewController {
    
    private let verticalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private var verticalContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detailBackgroundImg") // 배경 이미지 파일의 이름을 사용
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 36)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "의정부시"
        label.numberOfLines = 1
        return label
    }()
    
    private let currentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Thin", size: 102)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "21°"
        label.numberOfLines = 1
        return label
    }()
    
    private let currentWeatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 24)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "흐림"
        label.numberOfLines = 1
        return label
    }()
    
    private let highLowTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "최고:29°  최저:15°"
        label.numberOfLines = 1
        return label
    }()
    
    private let todayWeatherBoxView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        return view
    }()
    
    private let weatherExpLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 18)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "08:00~09:00에 강우 상태가, 18:00에 한 때 흐린 상태가 예상됩니다."
        label.numberOfLines = 0
        return label
    }()
    
    private let weatherBoxlineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        return view
    }()
    
    private let horizontalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private var horizontalContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let timeLabel1: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Now"
        label.numberOfLines = 0
        return label
    }()
    
    private let weatherImageView1: UIImageView = {
        let image = UIImage(systemName: "sun.max.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let weatherTemperatureLabel1 = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "21°"
        label.numberOfLines = 0
        return label
    }()
    
    private let timeLabel2: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "10시"
        label.numberOfLines = 0
        return label
    }()
    
    private let weatherImageView2: UIImageView = {
        let image = UIImage(systemName: "cloud.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let weatherTemperatureLabel2 = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "21°"
        label.numberOfLines = 0
        return label
    }()
    
    private let timeLabel3: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "11시"
        label.numberOfLines = 0
        return label
    }()
    
    private let weatherImageView3: UIImageView = {
        let image = UIImage(systemName: "cloud.drizzle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let weatherTemperatureLabel3 = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "19°"
        label.numberOfLines = 0
        return label
    }()
    
    private let timeLabel4: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "12시"
        label.numberOfLines = 0
        return label
    }()
    
    private let weatherImageView4: UIImageView = {
        let image = UIImage(systemName: "cloud.heavyrain.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let weatherTemperatureLabel4 = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "19°"
        label.numberOfLines = 0
        return label
    }()
    
    private let timeLabel5: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "1시"
        label.numberOfLines = 0
        return label
    }()
    
    private let weatherImageView5: UIImageView = {
        let image = UIImage(systemName: "cloud.sleet.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let weatherTemperatureLabel5 = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "17°"
        label.numberOfLines = 0
        return label
    }()
    
    private let timeLabel6: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "2시"
        label.numberOfLines = 0
        return label
    }()
    
    private let weatherImageView6: UIImageView = {
        let image = UIImage(systemName: "cloud.moon.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let weatherTemperatureLabel6 = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "15°"
        label.numberOfLines = 0
        return label
    }()
    
    private let timeLabel7: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 17)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "3시"
        label.numberOfLines = 0
        return label
    }()
    
    private let weatherImageView7: UIImageView = {
        let image = UIImage(systemName: "smoke.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let weatherTemperatureLabel7 = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 22)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "14°"
        label.numberOfLines = 0
        return label
    }()
    
    
    private let bottomlineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        return view
    }()
    
    private let bottomLeftButton: UIButton = {
        let button = UIButton(type: .system)
        let systemImage = UIImage(systemName: "map")?.withRenderingMode(.alwaysTemplate)
        button.setImage(systemImage, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let bottomRightButton: UIButton = {
        let button = UIButton(type: .system)
        let systemImage = UIImage(systemName: "list.bullet")?.withRenderingMode(.alwaysTemplate)
        button.setImage(systemImage, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let bottomCenterLefttButton: UIButton = {
        let button = UIButton(type: .system)
        let systemImage = UIImage(systemName: "location.fill")?.withRenderingMode(.alwaysTemplate)
        button.setImage(systemImage, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let bottomCenterRighttButton: UIButton = {
        let button = UIButton(type: .system)
        let systemImage = UIImage(systemName: "circle.fill")?.withRenderingMode(.alwaysTemplate)
        button.setImage(systemImage, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomRightButton.addTarget(self, action: #selector(bottomRightButtonTapped), for: .touchUpInside)
        setupLayout()
        setupTodayWeatherBox()
        setupBottomLayout()
    }
    
    @objc private func bottomRightButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupLayout() {
        
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(verticalScrollView)
        verticalScrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        verticalScrollView.addSubview(verticalContentView)
        verticalContentView.snp.makeConstraints { make in
            make.top.equalTo(verticalScrollView.contentLayoutGuide.snp.top)
            make.leading.equalTo(verticalScrollView.contentLayoutGuide.snp.leading)
            make.trailing.equalTo(verticalScrollView.contentLayoutGuide.snp.trailing)
            make.bottom.equalTo(verticalScrollView.contentLayoutGuide.snp.bottom)
            make.width.equalTo(verticalScrollView)
            make.height.greaterThanOrEqualTo(view).priority(.low)
        }
        
        verticalContentView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(verticalContentView.snp.top).offset(34)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        verticalContentView.addSubview(currentTemperatureLabel)
        currentTemperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom)
            make.centerX.equalTo(verticalContentView.snp.centerX)
        }
        
        verticalContentView.addSubview(currentWeatherLabel)
        currentWeatherLabel.snp.makeConstraints { make in
            make.top.equalTo(currentTemperatureLabel.snp.bottom)
            make.centerX.equalTo(verticalContentView.snp.centerX)
        }
        
        verticalContentView.addSubview(highLowTemperatureLabel)
        highLowTemperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(currentWeatherLabel.snp.bottom)
            make.centerX.equalTo(verticalContentView.snp.centerX)
        }
        
        verticalContentView.addSubview(todayWeatherBoxView)
        todayWeatherBoxView.snp.makeConstraints { make in
            make.top.equalTo(currentWeatherLabel.snp.bottom).offset(44)
            make.leading.equalTo(verticalContentView.snp.leading).inset(20)
            make.trailing.equalTo(verticalContentView.snp.trailing).inset(20)
            make.height.equalTo(212)
        }
        
    }

    func setupTodayWeatherBox() {
        todayWeatherBoxView.addSubview(weatherExpLabel)
        weatherExpLabel.snp.makeConstraints { make in
            make.top.equalTo(todayWeatherBoxView.snp.top).offset(10)
            make.leading.equalTo(todayWeatherBoxView.snp.leading).offset(15)
            make.trailing.equalTo(todayWeatherBoxView.snp.trailing).offset(-15)
        }
        
        todayWeatherBoxView.addSubview(weatherBoxlineView)
        weatherBoxlineView.snp.makeConstraints { make in
            make.top.equalTo(weatherExpLabel.snp.bottom).offset(11)
            make.leading.equalTo(todayWeatherBoxView.snp.leading).offset(14)
            make.trailing.equalTo(todayWeatherBoxView.snp.trailing).offset(-14)
            make.height.equalTo(1)
        }
        
        todayWeatherBoxView.addSubview(horizontalScrollView)
        horizontalScrollView.snp.makeConstraints { make in
            make.top.equalTo(weatherBoxlineView.snp.bottom)
            make.leading.equalTo(todayWeatherBoxView.snp.leading)
            make.trailing.equalTo(todayWeatherBoxView.snp.trailing)
            make.bottom.equalTo(todayWeatherBoxView.snp.bottom)
        }
        
        horizontalScrollView.addSubview(horizontalContentView)
        horizontalContentView.snp.makeConstraints { make in
            make.top.equalTo(horizontalScrollView.contentLayoutGuide.snp.top)
            make.leading.equalTo(horizontalScrollView.contentLayoutGuide.snp.leading)
            make.trailing.equalTo(horizontalScrollView.contentLayoutGuide.snp.trailing)
            make.bottom.equalTo(horizontalScrollView.contentLayoutGuide.snp.bottom)
            make.height.equalTo(horizontalScrollView)
            make.width.equalTo((44 + 22) * 7)
        }
        
        horizontalContentView.addSubview(timeLabel1)
        timeLabel1.snp.makeConstraints { make in
            make.top.equalTo(horizontalContentView.snp.top).offset(14)
            make.leading.equalTo(horizontalContentView.snp.leading).offset(20)
        }
        
        horizontalContentView.addSubview(weatherImageView1)
        weatherImageView1.snp.makeConstraints { make in
            make.top.equalTo(timeLabel1.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel1.snp.centerX)
            make.width.height.equalTo(44)
        }
        
        horizontalContentView.addSubview(weatherTemperatureLabel1)
        weatherTemperatureLabel1.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView1.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel1.snp.centerX)
        }
        
        horizontalContentView.addSubview(timeLabel2)
        timeLabel2.snp.makeConstraints { make in
            make.top.equalTo(horizontalContentView.snp.top).offset(14)
            make.leading.equalTo(timeLabel1.snp.trailing).offset(31.5)
        }
        
        horizontalContentView.addSubview(weatherImageView2)
        weatherImageView2.snp.makeConstraints { make in
            make.top.equalTo(timeLabel2.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel2.snp.centerX)
            make.width.height.equalTo(44)
        }
        
        horizontalContentView.addSubview(weatherTemperatureLabel2)
        weatherTemperatureLabel2.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView2.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel2.snp.centerX)
        }
        
        horizontalContentView.addSubview(timeLabel3)
        timeLabel3.snp.makeConstraints { make in
            make.top.equalTo(horizontalContentView.snp.top).offset(14)
            make.leading.equalTo(timeLabel2.snp.trailing).offset(31.5)
        }
        
        horizontalContentView.addSubview(weatherImageView3)
        weatherImageView3.snp.makeConstraints { make in
            make.top.equalTo(timeLabel3.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel3.snp.centerX)
            make.width.height.equalTo(44)
        }
        
        horizontalContentView.addSubview(weatherTemperatureLabel3)
        weatherTemperatureLabel3.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView3.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel3.snp.centerX)
        }
        
        horizontalContentView.addSubview(timeLabel4)
        timeLabel4.snp.makeConstraints { make in
            make.top.equalTo(horizontalContentView.snp.top).offset(14)
            make.leading.equalTo(timeLabel3.snp.trailing).offset(31.5)
        }
        
        horizontalContentView.addSubview(weatherImageView4)
        weatherImageView4.snp.makeConstraints { make in
            make.top.equalTo(timeLabel4.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel4.snp.centerX)
            make.width.height.equalTo(44)
        }
        
        horizontalContentView.addSubview(weatherTemperatureLabel4)
        weatherTemperatureLabel4.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView4.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel4.snp.centerX)
        }
        
        horizontalContentView.addSubview(timeLabel5)
        timeLabel5.snp.makeConstraints { make in
            make.top.equalTo(horizontalContentView.snp.top).offset(14)
            make.leading.equalTo(timeLabel4.snp.trailing).offset(31.5)
        }
        
        horizontalContentView.addSubview(weatherImageView5)
        weatherImageView5.snp.makeConstraints { make in
            make.top.equalTo(timeLabel5.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel5.snp.centerX)
            make.width.height.equalTo(44)
        }
        
        horizontalContentView.addSubview(weatherTemperatureLabel5)
        weatherTemperatureLabel5.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView5.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel5.snp.centerX)
        }
        
        horizontalContentView.addSubview(timeLabel6)
        timeLabel6.snp.makeConstraints { make in
            make.top.equalTo(horizontalContentView.snp.top).offset(14)
            make.leading.equalTo(timeLabel5.snp.trailing).offset(31.5)
        }
        
        horizontalContentView.addSubview(weatherImageView6)
        weatherImageView6.snp.makeConstraints { make in
            make.top.equalTo(timeLabel6.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel6.snp.centerX)
            make.width.height.equalTo(44)
        }
        
        horizontalContentView.addSubview(weatherTemperatureLabel6)
        weatherTemperatureLabel6.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView6.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel6.snp.centerX)
        }
        
        horizontalContentView.addSubview(timeLabel7)
        timeLabel7.snp.makeConstraints { make in
            make.top.equalTo(horizontalContentView.snp.top).offset(14)
            make.leading.equalTo(timeLabel6.snp.trailing).offset(31.5)
        }
        
        horizontalContentView.addSubview(weatherImageView7)
        weatherImageView7.snp.makeConstraints { make in
            make.top.equalTo(timeLabel7.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel7.snp.centerX)
            make.width.height.equalTo(44)
        }
        
        horizontalContentView.addSubview(weatherTemperatureLabel7)
        weatherTemperatureLabel7.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView7.snp.bottom).offset(14)
            make.centerX.equalTo(timeLabel7.snp.centerX)
        }
    }
    
    func setupBottomLayout() {
        view.addSubview(bottomLeftButton)
        bottomLeftButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-4)
            make.leading.equalTo(view.snp.leading).offset(10)
            make.width.height.equalTo(44)
        }
        
        view.addSubview(bottomRightButton)
        bottomRightButton.snp.makeConstraints { make in
            make.centerY.equalTo(bottomLeftButton.snp.centerY)
            make.trailing.equalTo(view.snp.trailing).offset(-10)
            make.width.height.equalTo(44)
        }
        
        view.addSubview(bottomCenterLefttButton)
        bottomCenterLefttButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.centerX).offset(-4)
            make.centerY.equalTo(bottomLeftButton.snp.centerY)
            make.width.height.equalTo(11)
        }
        
        view.addSubview(bottomCenterRighttButton)
        bottomCenterRighttButton.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.centerX).offset(4)
            make.centerY.equalTo(bottomLeftButton.snp.centerY)
            make.width.height.equalTo(11)
        }
        
        view.addSubview(bottomlineView)
        bottomlineView.snp.makeConstraints { make in
            make.bottom.equalTo(bottomLeftButton.snp.top).offset(-8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
