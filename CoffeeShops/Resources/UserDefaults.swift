//
//  UserDefaults.swift
//  CoffeeShops
//
//  Created by Наталья on 09.02.2024.
//

import Foundation

final class UserDefaultsWorker {
    static let shared = UserDefaultsWorker()
    
    private static let KEY_ACCESS_TOKEN = "auth_token"
    private static let KEY_ACCESS_TOKEN_LIFETIME = "auth_token_lifetime"
    
    func saveAuthToken(user: UserModel) {
        let defaults = UserDefaults.standard
        defaults.set(user.token, forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN)
        defaults.set(user.tokenLifetime, forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN_LIFETIME)
    }
    
    func getAccessToken() -> String {
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN) as? String ?? ""
        return token
    }
    
    func haveAuthToken() -> Bool {
        return !getAccessToken().isEmpty
    }
}
