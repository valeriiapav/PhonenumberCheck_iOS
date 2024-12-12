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
    
    //TODO: clear this mess
    var body: some View {
        VStack {
            
            TextField("Enter phone number:", text: $currentNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button{
                fetchPhoneInfo()
            } label: {
                Text("Press to search current number")
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 60)
            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing)) // Gradient background
            .cornerRadius(15)
            
            if currentNumberInfo != nil {
                VStack (alignment: .leading) {
                    Text(currentNumberInfo?.number ?? "")
                    Text(currentNumberInfo?.carrier ?? "")
                    Text(currentNumberInfo?.countryCode ?? "")
                    Text(currentNumberInfo?.countryName ?? "")
                    Text(currentNumberInfo?.countryPrefix ?? "")
                    Image(systemName: currentNumberInfo?.valid ?? false ? "checkmark.square" : "square")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(currentNumberInfo?.valid ?? false ? .green : .gray)
                }
                .animation(.easeIn(duration: 1.0), value: currentNumberInfo != nil)
            }
        }
        .padding()
        .onChange(of: viewModel.currentPhoneInfo) { oldPhoneInfo, newPhoneInfo in
            self.currentNumberInfo = newPhoneInfo
        }
    }
    
    func fetchPhoneInfo() {
        
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
