//
//  WeatherGetService.swift
//  KangMinSoo-assignment
//
//  Created by 강민수 on 11/14/23.
//

import Foundation

class WeatherGetService {
    static let shared = WeatherGetService()
    private init() {}
    
    func makeRequest(cityName: String) -> URLRequest {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=02713bb6d2296300f0ba160aec820107&units=metric")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func getWeatherData(cityName: String) async throws -> WeatherResponse? {
        do {
            let request = self.makeRequest(cityName: cityName)
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            return parseUserInfoData(data: data)
        } catch {
            throw error
        }
    }
    
    
    private func parseUserInfoData(data: Data) -> WeatherResponse? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(WeatherResponse.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}

