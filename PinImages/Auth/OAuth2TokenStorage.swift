//
//  OAuth2TokenStorage.swift
//  PinImages
//

import Foundation

final class OAuth2TokenStorage {
    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: "oauth2Token")
        }
        set {
            return UserDefaults.standard.set(newValue, forKey: "oauth2Token")
        }
    }
}
