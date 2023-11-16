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
    private var weatherResponse: [WeatherResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        delegate()
        hieararchy()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getWeatherData()
    }
    
    func setupNavigation() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func delegate() {
        weatherListView.searchBar.delegate = self
        weatherListView.weatherTableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        weatherListView.weatherTableView.delegate = self
        weatherListView.weatherTableView.dataSource = self
    }
    
    func hieararchy() {
        view.addSubview(weatherListView)
    }
    
    private func setLayout() {
        weatherListView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    @objc func ellipsisButtonTapped() {
        print("ellipsisButton이 클릭되었습니다.")
    }
    
    func getWeatherData() {
        Task {
            do {
                let cities = ["seoul", "suwon", "yeoju", "beijing", "tokyo", "Gwangjin-gu"]
                
                for cityName in cities {
                    do {
                        if let receivedData = try await WeatherGetService.shared.getWeatherData(cityName: cityName) {
                            weatherResponse.append(receivedData)
                        }
                    } catch {
                        print("Failed to get weather data")
                    }
                }
                DispatchQueue.main.async {
                    self.weatherListView.weatherTableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
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

extension WeatherListVC: UITableViewDelegate {}
extension WeatherListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.bindData(weatherResponse: weatherResponse[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailWeatherVC = DetailWeatherVC()
        self.navigationController?.pushViewController(detailWeatherVC, animated: true)
    }
}
