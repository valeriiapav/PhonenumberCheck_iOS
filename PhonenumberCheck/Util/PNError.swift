//
//  PNError.swift
//  PhonenumberCheck
//
//  Created by Valery on 12.12.2024.
//

import Foundation

//TODO: Potentially need more errors here
enum PNError: Error {
    case invalidAccessToken
    case invalidResponse
    case failedToFetchPhoneNumber
}
