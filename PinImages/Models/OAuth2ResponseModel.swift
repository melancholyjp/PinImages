//
//  OAuth2ResponseModel.swift
//  PinImages
//

struct OAuthTokenResponseBody: Codable {
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
    
    let accessToken: String
}
