//
//  OAuth2Service.swift
//  PinImages
//

import Foundation

final class OAuth2Service {
    static let shared = OAuth2Service()
    private init() {}
    
    private func makeOAuthTokenRequest(code: String) -> URLRequest? {
        guard var urlComponents = URLComponents(string: "https://unsplash.com/oauth/token") else { return nil }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: LoginConstants.accessKey),
            URLQueryItem(name: "client_secret", value: LoginConstants.secretKey),
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_url", value: LoginConstants.redirectURL)
        ]
        
        guard let authTokenUtl = urlComponents.url else { return nil }
        
        var request = URLRequest(url: authTokenUtl)
        request.httpMethod = "POST"
        return request
    }
    
    private func fetchOAuthToken(code: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let request = makeOAuthTokenRequest(code: code) else {
            completion(.failure(NSError(domain: "InvalidURL", code: -1, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let data else {
                return completion(.failure(NSError(domain: "Empty data", code: 0, userInfo: nil)))
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
