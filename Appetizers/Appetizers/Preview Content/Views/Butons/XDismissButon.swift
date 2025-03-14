//
//  XDismissButon.swift
//  Appetizers
//
//  Created by SSDHDDQ on 12.03.2025.
//

import SwiftUI

struct XDismissButon: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .frame(width: 44, height: 44)
                .imageScale(.small)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    XDismissButon()
}
