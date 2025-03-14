//
//  StandartButtonStyle.swift
//  Appetizers
//
//  Created by SSDHDDQ on 14.03.2025.
//

import SwiftUI


struct StandartButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
