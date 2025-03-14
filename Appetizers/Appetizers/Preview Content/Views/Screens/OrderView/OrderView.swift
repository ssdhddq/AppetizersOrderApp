//
//  OrderView.swift
//  Appetizers
//
//  Created by SSDHDDQ on 04.03.2025.
//

import SwiftUI

struct OrderView: View {
//    @State private var orderItems = MockData.orderItems
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete (perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        print("tap")
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order")
                }
            }
            .navigationTitle("📋 Orders")
        }
    }
}

#Preview {
    OrderView()
}
