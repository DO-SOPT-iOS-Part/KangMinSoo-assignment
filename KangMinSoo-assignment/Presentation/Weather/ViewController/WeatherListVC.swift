//
//  WeatherListVC.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 10/14/23.
//

import UIKit

import SnapKit
import Then

class WeatherListVC: UIViewController {
    
    private var weatherListView = WeatherListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        delegate()
        
        hieararchy()
        setLayout()
    }
    
    func setupNavigation() {
        navigationController?.isNavigationBarHidden = false
        
        if let ellipsisImage = UIImage(systemName: "ellipsis.circle") {
            let whiteEllipsisImage = ellipsisImage.withTintColor(.white, renderingMode: .alwaysOriginal)
            
            let ellipsisButton = UIBarButtonItem(image: whiteEllipsisImage, style: .plain, target: self, action: #selector(ellipsisButtonTapped))
            
            navigationItem.rightBarButtonItem = ellipsisButton
        }
    }
    
    private func delegate() {
        weatherListView.searchBar.delegate = self
        weatherListView.weatherCollectionView.register(WeatherCollectionViewCell.self,
                                forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
        weatherListView.weatherCollectionView.delegate = self
        weatherListView.weatherCollectionView.dataSource = self
    }
    
    func hieararchy() {
        view.addSubview(weatherListView)
    }
    
    private func setLayout() {
        weatherListView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    @objc func ellipsisButtonTapped() {
        print("ellipsisButton이 클릭되었습니다.")
    }
}

extension WeatherListVC: UISearchBarDelegate {
    // textField의 text가 변화할 때 마다 호출
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
    
    // 서치바 검색이 끝났을 때 호출
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    }
}

extension WeatherListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = DetailWeatherVC()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
extension WeatherListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier,
                                                            for: indexPath) as? WeatherCollectionViewCell else {return UICollectionViewCell()}
        return item
    }
}

extension WeatherListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Size.width - 40) , height: 117)
    }
}
