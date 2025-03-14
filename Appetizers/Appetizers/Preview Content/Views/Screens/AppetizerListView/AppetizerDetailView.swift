//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by SSDHDDQ on 12.03.2025.
//

import SwiftUI

struct AppetizerDetailView: View {
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            AppetizersRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            
            HStack(spacing: 40) {
                NutritionInfoView(title: "Calories", value: appetizer.calories)
                NutritionInfoView(title: "Carbs", value: appetizer.carbs)
                NutritionInfoView(title: "Protein", value: appetizer.protein)
            }
            
            Spacer()
            
//            Button("$\(appetizer.price, specifier: "%.2f") - Add to Order") {
//                order.add(appetizer)
//                isShowingDetailView = false
//            }
//            .modifier(StandartButtonStyle())
//            .padding(.bottom, 30)
            
            Button {
                order.add(appetizer)
                isShowingDetailView = false
            } label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) { Button {
            isShowingDetailView = false
        } label: {
            XDismissButon()
        }
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetailView: .constant(false))
}
