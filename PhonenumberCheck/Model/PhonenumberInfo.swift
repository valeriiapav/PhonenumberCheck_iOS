//
//  PhonenumberInfo.swift
//  PhonenumberCheck
//
//  Created by Valery on 12.12.2024.
//

import Foundation

struct PhonenumberInfo: Hashable, Codable {
    let valid: Bool
    let number: String
    let localFormat: String
    let internationalFormat: String
    let countryPrefix: String
    let countryCode: String
    let countryName: String
    let location: String
    let carrier: String
    let lineType: String
}
