//
//  DetailWeatherVC.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 10/27/23.
//

import UIKit
import SnapKit

class DetailWeatherVC: UIViewController {
    
    private let detailWeatherView = DetailWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hieararchy()
        setLayout()
        delegate()
        setButtonEvent()
    }
    
    func setButtonEvent() {
        detailWeatherView.detailWeatherBottomView.listButton.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
    }
    
    private func delegate() {
        detailWeatherView.detailWeatherBoxView.weatherBoxCollectionView.register(WeatherBoxCollectionViewCell.self,
                                               forCellWithReuseIdentifier: WeatherBoxCollectionViewCell.identifier)
        detailWeatherView.detailWeatherBoxView.weatherBoxCollectionView.delegate = self
        detailWeatherView.detailWeatherBoxView.weatherBoxCollectionView.dataSource = self
    }
    
    @objc private func listButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func hieararchy() {
        view.addSubview(detailWeatherView)
    }
    
    private func setLayout() {
        detailWeatherView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

extension DetailWeatherVC: UICollectionViewDelegate {
}
extension DetailWeatherVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherBoxCollectionViewCell.identifier, for: indexPath) as? WeatherBoxCollectionViewCell else { return UICollectionViewCell()}
        return item
    }
}

