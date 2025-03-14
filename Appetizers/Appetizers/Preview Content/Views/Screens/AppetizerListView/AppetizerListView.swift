//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by SSDHDDQ on 04.03.2025.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        //.listRowSeparator(.hidden)
                        .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .disabled(viewModel.isShowingDetailView)
            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            .alert(viewModel.alertItem?.title ?? Text(""), isPresented: $viewModel.isShowingAlert) {
                
            } message: {
                viewModel.alertItem?.message ?? Text("")
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            if viewModel.isShowingDetailView {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
        
    }
    
}

#Preview {
    AppetizerListView()
}
