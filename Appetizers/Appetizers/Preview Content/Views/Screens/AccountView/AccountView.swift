//
//  AccountView.swift
//  Appetizers
//
//  Created by SSDHDDQ on 04.03.2025.
//

import SwiftUI

struct AccountView: View {
    enum FormTextField {
        case firstName, lastName, email
    }
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(content: {
                    TextField("FirstName", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("LastName", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                    
                    DatePicker("Birthdate", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    Button("Save Changes") {
                        viewModel.saveChanges()
                    }
                    
                }, header: {
                    Text("Personal Info")
                })
                
                Section(content: {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                    
                }, header: {
                    Text("Requests")
                })
                .tint(.brandPrimary)
            }
            
            .navigationTitle("👰‍♀️ Account")
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(viewModel.alertItem?.title ?? Text(""), isPresented: $viewModel.isShowingAlert) {
            
        } message: {
            viewModel.alertItem?.message
        }
    }
}

#Preview {
    AccountView()
}
