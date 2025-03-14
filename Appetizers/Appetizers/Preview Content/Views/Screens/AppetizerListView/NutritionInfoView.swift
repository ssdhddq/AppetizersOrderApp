//
//  NutritionInfoView.swift
//  Appetizers
//
//  Created by SSDHDDQ on 12.03.2025.
//

import SwiftUI

struct NutritionInfoView: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    NutritionInfoView(title: "Title", value: 0)
}
