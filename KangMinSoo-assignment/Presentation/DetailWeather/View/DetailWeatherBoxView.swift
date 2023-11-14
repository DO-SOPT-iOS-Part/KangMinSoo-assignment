//
//  DetailWeatherBoxView.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 11/7/23.
//

import UIKit

import SnapKit
import Then

class DetailWeatherBoxView: UIView {
    
    private let weatherExpLabel = UILabel()
    private let weatherBoxlineView = UIView()
    var weatherBoxCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        hieararchy()
        setLayout()
        setCollectionViewLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        self.do {
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
        }
        
        weatherExpLabel.do {
            $0.text = "08:00~09:00에 강우 상태가, 18:00에 한 때 흐린 상태가 예상됩니다."
            $0.font = .medium(size: 18)
            $0.textColor = .white
            $0.numberOfLines = 0
        }
        
        weatherBoxlineView.do {
            $0.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25)
        }
        
        weatherBoxCollectionView.do {
            $0.backgroundColor = .clear
        }
    }
    
    func hieararchy() {
        addSubViews(weatherExpLabel,
                    weatherBoxlineView,
                    weatherBoxCollectionView)
    }
    
    func setLayout() {
        
        weatherExpLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        weatherBoxlineView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(66)
            $0.leading.trailing.equalToSuperview().inset(14)
            $0.height.equalTo(1)
        }
        
        weatherBoxCollectionView.snp.makeConstraints {
            $0.top.equalTo(weatherBoxlineView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.width.equalTo(Size.width - 40)
        }
        
    }
    
    func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 44 , height: 145)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 22
        flowLayout.minimumInteritemSpacing = 3
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        weatherBoxCollectionView.collectionViewLayout = flowLayout
    }
    
}
