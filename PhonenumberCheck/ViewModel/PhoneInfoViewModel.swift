//
//  PhonenumberInfoViewModel.swift
//  PhonenumberCheck
//
//  Created by Valery on 12.12.2024.
//

import Foundation

class PhoneInfoViewModel: ObservableObject {
    
    @Published var currentPhoneInfo: PhonenumberInfo?
    
    func fetchPhoneInfo(_ inputNumber: String) {
        Task {
            do {
                let phonenumberInfo = try await NetworkManager.networkManager.validatePhoneNumber()
                await MainActor.run {
                    self.currentPhoneInfo = phonenumberInfo
                    }
                } catch {
                    throw PNError.failedToFetchPhoneNumber
                }
        }
    }
}

//func fetchPhoneInfo(_ inputNumber: String) async throws {
//    do {
//        let phonenumberInfo = try await NetworkManager.networkManager.validatePhoneNumber()
//        currentPhoneInfo = phonenumberInfo
//    } catch {
//        throw PNError.failedToFetchPhoneNumber
//    }
//}
