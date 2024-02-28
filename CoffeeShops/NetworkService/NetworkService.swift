//
//  ApiService.swift
//  CoffeeShops
//
//  Created by Наталья on 07.02.2024.
//

import Alamofire
import Foundation

class NetworkService: NetworkServiceProtocol {
    static var shared = NetworkService()
    
    private let baseUrl = "http://147.78.66.203:3210/"
    private let userDefaults = UserDefaultsWorker.shared
    private var headers: HTTPHeaders = ["Accept": "application/json",
                                        "Content-Type": "application/json"]
    
    func authorization(login: String, password: String, type: AuthorizationType) async throws {
        let body = AuthorizationBody(login: login, password: password)
        let request = AF.request(baseUrl + type.url, method: .post, parameters: body, encoder: .json, headers: headers)
        
        return try await withCheckedThrowingContinuation { continuation in
            request.responseDecodable(of: UserModel.self) { [weak self] response in
                guard let self = self else { return }
                switch response.result {
                case let .success(user):
                    self.userDefaults.saveAuthToken(user: user)
                    continuation.resume()
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func getLocations() async throws -> [LocationModel] {
        headers.add(name: "Authorization", value: "Bearer \(userDefaults.getAccessToken())")
        let request = AF.request(baseUrl + "locations", method: .get, headers: headers)
        
        return try await withCheckedThrowingContinuation { continuation in
            request.responseDecodable(of: [LocationModel].self) { response in
                switch response.result {
                case let .success(locations):
                    continuation.resume(returning: locations)
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func getMenu(id: Int) async throws -> [CoffeeModel] {
        headers.add(name: "Authorization", value: "Bearer \(userDefaults.getAccessToken())")
        let request = AF.request(baseUrl + "location/\(id)/menu", method: .get, headers: headers)
        
        return try await withCheckedThrowingContinuation { continuation in
            request.responseDecodable(of: [CoffeeModel].self) { response in
                switch response.result {
                case let .success(menu):
                    continuation.resume(returning: menu)
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
