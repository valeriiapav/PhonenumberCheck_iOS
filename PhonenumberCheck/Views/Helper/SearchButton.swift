//
//  SearchButton.swift
//  PhonenumberCheck
//
//  Created by Valery on 13.12.2024.
//

import SwiftUI

struct SearchButton: View {
    var function: () -> Void
    
    var body: some View {
        Button {
            self.function()
        } label: {
            HStack {
                Text("Search")
                Label("Search", systemImage: "magnifyingglass")
                    .labelStyle(.iconOnly)
            }
        }
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .frame(width: 300, height: 60)
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing)) // Gradient background
        .cornerRadius(15)
    }
}

#Preview {
    SearchButton(function: {})
}
