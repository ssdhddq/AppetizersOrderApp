//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by SSDHDDQ on 04.03.2025.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
