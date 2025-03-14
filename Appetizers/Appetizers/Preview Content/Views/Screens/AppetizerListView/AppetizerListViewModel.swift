//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by SSDHDDQ on 11.03.2025.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var isShowingAlert = false
    @Published var alertItem: AlertItem? {
        didSet { isShowingAlert = true }
    }
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer: Appetizer?
    
    //    func getAppetizers() {
    //        isLoading = true
    //
    //        NetworkManager.shared.getAppetizers { result in
    //            DispatchQueue.main.async {
    //
    //                self.isLoading = false
    //
    //                switch result {
    //                case .success(let appetizers):
    //                    self.appetizers = appetizers
    //                case .failure(let error):
    //                    switch error {
    //                    case .invalidURL:
    //                        self.alertItem = AlertContext.invalidURL
    //                    case .invalidResponse:
    //                        self.alertItem = AlertContext.invalidResponse
    //                    case .invalidData:
    //                        self.alertItem = AlertContext.invalidData
    //                    case .unableToComplete:
    //                        self.alertItem = AlertContext.unableToComplete
    //                    }
    //                }
    //            }
    //        }
    //    }
        
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }
    
}
