//
//  OAuth2Service.swift
//  PinImages
//

import Foundation

final class OAuth2Service {
    
    //MARK: - Constants
    
    static let shared = OAuth2Service()
    
    private let dataStorage = OAuth2TokenStorage()
    private var task: URLSessionTask?
    private var lastCode: String?
    
    private init() { }
    
    //MARK: - Private functions
    
    private func makeOAuthTokenRequest(code: String) -> URLRequest? {
        guard var urlComponents = URLComponents(string: "https://unsplash.com/oauth/token") else { return nil }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: LoginConstants.accessKey),
            URLQueryItem(name: "client_secret", value: LoginConstants.secretKey),
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: LoginConstants.redirectURL)
        ]
        
        guard let authTokenUtl = urlComponents.url else {
            print("Fail to take URL")
            return nil
        }
        
        var request = URLRequest(url: authTokenUtl)
        request.httpMethod = "POST"
        return request
    }
    
    func fetchOAuthToken(code: String, completion: @escaping (Result<String, Error>) -> Void) {
        assert(Thread.isMainThread)
        guard lastCode != code else {
            completion(.failure(NetworkError.invalidRequest))
            return
        }
        
        task?.cancel()
        lastCode = code
        
        guard let request = makeOAuthTokenRequest(code: code) else {
            completion(.failure(NetworkError.invalidRequest))
            print("Network error, invalid request")
            
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) {
            [weak self] data, request, error in
            DispatchQueue.main.async {
                guard self != nil else { return }
                if let error {
                    completion(.failure(error))
                    print("Unsplash network error - \(error)")
                    return
                }
                
                guard let data else { return }
                
                do {
                    let responseData = try JSONDecoder().decode(OAuthTokenResponseBody.self, from: data)
                    completion(.success(responseData.accessToken))
                } catch {
                    completion(.failure(NetworkError.decodingError(error)))
                    print("Service model decoding error - \(error)")
                }
                self?.task = nil
                self?.lastCode = nil
            }
        }
        self.task = task
        task.resume()
    }
}
