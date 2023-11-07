//
//  WeatherListView.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 11/7/23.
//

import UIKit

import SnapKit
import Then

class WeatherListView: UIView {
    
    let placeholder: String = "도시 또는 공항 검색"
    private lazy var attributedString = NSMutableAttributedString(
                                                string: placeholder,
                                                attributes: [
                                                    NSAttributedString.Key.font: UIFont.regular(size: 19),
                                                    NSAttributedString.Key.foregroundColor: UIColor(white: 1,alpha: 0.5)])
    
    private let titleLabel = UILabel()
    var searchBar = UISearchBar()
    var weatherCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        
        titleLabel.do {
            $0.text = "날씨"
            $0.font = .bold(size: 36)
            $0.textColor = .white
        }
        
        searchBar.do {
            $0.showsCancelButton = false
            $0.backgroundImage = UIImage()
            $0.searchTextField.textColor = .white
            $0.searchTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
            $0.searchTextField.leftView?.tintColor = UIColor(white: 1, alpha: 0.5)
            $0.searchTextField.attributedPlaceholder = attributedString
        }
        
        weatherCollectionView.do {
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 16
        }
    }
    
    func hieararchy() {
        addSubViews(titleLabel,
                    searchBar,
                    weatherCollectionView)
    }
    
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        weatherCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(15)
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
        }
    }
    
}
