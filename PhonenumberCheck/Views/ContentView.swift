//
//  ContentView.swift
//  PhonenumberCheck
//
//  Created by Valery on 12.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var phonenumberInfo: PhonenumberInfo?
    @State private var errorMessage: PNError?
    @State private var isLoading: Bool = false
    
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
            } else {
                Text(phonenumberInfo?.number ?? "")
            }
            //TODO: handle errors
            if let errorMessage = errorMessage {
                Text("Nothing to see here :(")
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            Task {
                await fetchPhonenumberInfo()
            }
        }
    }
    
    func fetchPhonenumberInfo() async {
        isLoading = true
        errorMessage = nil
            
        do {
            let phonenumberInfo = try await NetworkManager.networkManager.validatePhoneNumber()
            self.phonenumberInfo = phonenumberInfo
        } catch {
            self.errorMessage = PNError.failedToFetchPhoneNumber
        }
            
        isLoading = false
    }
}


#Preview {
    ContentView()
}
