//
//  PhoneInfoView.swift
//  PhonenumberCheck
//
//  Created by Valery on 12.12.2024.
//

import SwiftUI

struct PhoneInfoView: View {
    @ObservedObject private var viewModel = PhoneInfoViewModel()
    @State private var currentNumber: String = "14158586273"
    @State private var currentNumberInfo: PhonenumberInfo?
    @State private var errorState: PNError?
    
    var body: some View {
        VStack {
            PhoneInput(currentNumber: $currentNumber)
            SearchButton(function: {fetchPhoneInfo()})
            
            if currentNumberInfo != nil {
                PhoneDetailsView(currentNumberInfo: $currentNumberInfo)
            }
        }
        .padding()
        .onChange(of: viewModel.currentPhoneInfo) { oldPhoneInfo, newPhoneInfo in
            self.currentNumberInfo = newPhoneInfo
        }
        .gesture(
            TapGesture()
                .onEnded {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        )
    }
    
    func fetchPhoneInfo() {
        if currentNumber.isEmpty {
            return
        }
        
        //TODO handle errors
        do {
            try viewModel.fetchPhoneInfo(currentNumber)
        } catch {
            
        }
    }
}

#Preview {
    PhoneInfoView()
}
