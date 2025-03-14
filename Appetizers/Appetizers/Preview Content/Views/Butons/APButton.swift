//
//  APButton.swift
//  Appetizers
//
//  Created by SSDHDDQ on 12.03.2025.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(.brandPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    APButton(title: "Title")
}
