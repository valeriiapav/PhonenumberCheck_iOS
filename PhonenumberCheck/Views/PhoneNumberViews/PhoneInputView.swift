//
//  PhoneInput.swift
//  PhonenumberCheck
//
//  Created by Valery on 13.12.2024.
//

import SwiftUI

struct PhoneInput: View {
    @Binding var currentNumber: String
    
    var body: some View {
        VStack (alignment: .leading) {
            TextField("Enter phone number:", text: $currentNumber)
                .padding()
                .foregroundColor(currentNumber.isEmpty ? .red : .black)
                .background(.white)
                .overlay(RoundedRectangle(cornerRadius: 1)
                .stroke(currentNumber.isEmpty ? Color.red : Color.black, lineWidth: 1))
                .keyboardType(.phonePad)
            
            Text("  Please, enter phone number")
                .foregroundColor(.red)
                .font(.body)
                .opacity(currentNumber.isEmpty ? 1 : 0)
                
        }
        .padding()
    }
}

#Preview {
    PhoneInput(currentNumber: .constant("126351763515"))
}
