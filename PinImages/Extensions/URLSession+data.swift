//
//  URLSession+data.swift
//  PinImages
//

import Foundation

enum NetworkError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
    case invalidRequest
    case decodingError(Error)
}

extension URLSession {
    func dataTask(
        for request: URLRequest,
        completion: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionDataTask {
        let completeOnMain: (Result<Data, Error>) -> Void = { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        return dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(NetworkError.urlRequestError(error)))
                return
            }
            
            guard
                let httpResponse = response as? HTTPURLResponse
            else {
                completion(.failure(NetworkError.urlSessionError))
                return
            }
            
            guard 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(
                    NetworkError.httpStatusCode(httpResponse.statusCode)
                ))
                return
            }
            
            guard let data = data else {
                completeOnMain(.failure(NetworkError.urlSessionError))
                return
            }
            
            completeOnMain(.success(data))
        }
    }
}
