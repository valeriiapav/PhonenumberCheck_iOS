//
//  PhoneDetailsView.swift
//  PhonenumberCheck
//
//  Created by Valery on 13.12.2024.
//

import SwiftUI

struct PhoneDetailsView: View {
    @Binding var currentNumberInfo: PhonenumberInfo?
    
    var body: some View {
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

#Preview {
    PhoneDetailsView(currentNumberInfo: .constant(genericPhoneNumberInfo))
}
