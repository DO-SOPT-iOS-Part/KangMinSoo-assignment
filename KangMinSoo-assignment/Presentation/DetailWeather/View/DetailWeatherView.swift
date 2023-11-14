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
    let tenDayTableHeaderView = TenDayTableHeaderView()
    var tenDayWeatherTableView = UITableView(frame: .zero, style: .plain)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        hieararchy()
        setLayout()
        delegate()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func delegate() {
        tenDayWeatherTableView.register(TenDayWeatherTableViewCell.self, forCellReuseIdentifier: TenDayWeatherTableViewCell.identifier)
        tenDayWeatherTableView.delegate = self
        tenDayWeatherTableView.dataSource = self
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
        
        tenDayWeatherTableView.do {
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.25).cgColor
            $0.tableHeaderView = tenDayTableHeaderView
        }
    }
    
    func hieararchy() {
        addSubViews(backgroundImageView,
                    verticalScrollView,
                    detailWeatherBottomView)
        
        verticalScrollView.addSubview(verticalContentView)
        verticalContentView.addSubViews(detailWeatherTopView,
                                        detailWeatherBoxView,
                                        tenDayWeatherTableView)
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
        
        tenDayWeatherTableView.snp.makeConstraints {
            $0.top.equalTo(detailWeatherBoxView.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(588)
            $0.bottom.equalTo(verticalContentView.snp.bottom)
        }
        
        tenDayWeatherTableView.tableHeaderView?.frame = .init(origin: .zero,
                                                                 size: .init(width: UIScreen.main.bounds.width,
                                                                             height: 38))
        
        detailWeatherBottomView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(62)
        }
    }
    
}


extension DetailWeatherView: UITableViewDelegate {}
extension DetailWeatherView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TenDayWeatherTableViewCell.identifier,
                                                       for: indexPath) as? TenDayWeatherTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        return cell
    }
}
