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
    
    private let headerView = UIView()
    private let menuButton = UIButton()
    private let titleLabel = UILabel()
    var searchBar = UISearchBar()
    var weatherTableView = UITableView(frame: .zero, style: .grouped)
    
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
        headerView.do{
            $0.backgroundColor = .black
            $0.frame = CGRect(x: 0, y: 0, width: Size.width, height: Size.height/5.5)
            $0.layoutIfNeeded()
        }
        
        menuButton.do {
            $0.setBackgroundImage(Image.ellipsisCircle, for: .normal)
        }
        
        titleLabel.do {
            $0.text = "날씨"
            $0.font = .bold(size: 36)
            $0.textColor = .white
        }
        
        searchBar.do{
            $0.placeholder = "도시 또는 공항 검색"
            $0.searchTextField.backgroundColor = UIColor(named: "searchBar")
            $0.searchTextField.textColor = .white
            $0.searchTextField.attributedPlaceholder = NSAttributedString(string: $0.searchTextField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            $0.searchTextField.leftView?.tintColor = UIColor.lightGray
            $0.searchTextField.font = .regular(size: 19)
            $0.barTintColor = .clear
        }
        
        weatherTableView.do{
            $0.backgroundColor = .black
            $0.separatorStyle = .none
            $0.separatorColor = .black
            $0.rowHeight = Size.height/6
            $0.tableHeaderView = headerView
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    func hieararchy() {
        addSubViews(weatherTableView)
        
        headerView.addSubViews(titleLabel,
                               searchBar,
                               menuButton)
    }
    
    
    func setLayout() {
        
        headerView.layoutIfNeeded()
        
        menuButton.snp.makeConstraints{
            $0.top.equalTo(headerView)
            $0.size.equalTo(36)
            $0.trailing.equalTo(headerView).inset(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(menuButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
            $0.bottom.equalTo(headerView).inset(10)
        }
        
        weatherTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
}
