//
//  NetworkManager.swift
//  PhonenumberCheck
//
//  Created by Valery on 12.12.2024.
//

import Foundation
import Alamofire

//singleton class for handling network requests
class NetworkManager {
    static let networkManager = NetworkManager()
    let decoder = JSONDecoder()
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    private let baseUrl = "http://apilayer.net/api/validate"
    
    //TODO: Remove hardcode
    //func validatePhoneNumber(number: String, countryCode: String) async throws -> [User]
    func validatePhoneNumber() async throws -> PhonenumberInfo {
        var parameters: [String: Any]
        if let accessToken = getAPIAccessKey() {
           parameters = [
                "access_key": accessToken,
                "number": "14158586273",
                "country_code": "",
                "format": "1"  // The API expects this as a string value "1"
            ]
        } else {
            throw PNError.invalidAccessToken
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(baseUrl, method: .get, parameters: parameters)
                .responseDecodable(of: PhonenumberInfo.self, decoder: decoder) { response in
                switch response.result {
                case .success(let data):
                    continuation.resume(returning: data)
                case .failure:
                    continuation.resume(throwing: PNError.invalidResponse)
                }
            }
        }
    }
    
    //Just a simple way (tho not very secure) to store token and prevent it from uploading to github
    func getAPIAccessKey() -> String? {
        if let path = Bundle.main.path(forResource: "AccessToken", ofType: "plist") {
            let url = URL(fileURLWithPath: path)
            let decoder = PropertyListDecoder()
            
            do {
                let data = try Data(contentsOf: url)
                let plist = try decoder.decode([String: String].self, from: data)
                return plist["API_ACCESS_KEY"]
            } catch {
                print("Error reading plist: \(error)")
                return nil
            }
        }
        return nil
        
    }
}
