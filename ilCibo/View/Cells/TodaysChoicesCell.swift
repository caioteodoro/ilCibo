//
//  TodaysChoicesCell.swift
//  Cibber
//
//  Created by Caio Teodoro on 13/12/22.
//

import SwiftUI

struct TodaysChoicesCell: View {
    
    public var item: FoodItem
    
    func getTypeName() -> String {
        switch item.type {
        case .carb:
            return "carb"
        case .protein:
            return "protein"
        case .salad:
            return "salad"
        case .vegetable:
            return "vegetable"
        case .none:
            return ""
        }
    }
    
    func getTypeIcon() -> String {
        switch item.type {
        case .carb:
            return "Carb"
        case .protein:
            return "Protein"
        case .salad:
            return "Salad"
        case .vegetable:
            return "Vegetable"
        case .none:
            return ""
        }
    }
    
    func getTypePastelColor() -> Color {
        switch item.type {
        case .carb:
            return .pastelPurple
        case .protein:
            return .pastelOrange
        case .salad:
            return .pastelRed
        case .vegetable:
            return .pastelGreen
        case .none:
            return .white
        }
    }
    
    func getTypeDarkColor() -> Color {
        switch item.type {
        case .carb:
            return .darkPurple
        case .protein:
            return .darkOrange
        case .salad:
            return .darkRed
        case .vegetable:
            return .darkGreen
        case .none:
            return .white
        }
    }
    
    var body: some View {
        
        HStack {
            
            Image(getTypeIcon())
                .resizable()
                .frame(width: 40, height: 40)
            
            ZStack {
                
                Text(item.name)
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 40)
                    .overlay(RoundedRectangle(cornerRadius: 16)
                                .stroke(getTypePastelColor(),lineWidth: 4))
                
                VStack(alignment: .leading){
                    Text(LocalizedStringKey(getTypeName()))
                        .foregroundColor(getTypeDarkColor())
                        .font(.system(size: 14, weight: .semibold))
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                }
                .background(.white)
                .padding(EdgeInsets(top: 0, leading: -84, bottom: 44, trailing: 0))
                
            }
            
        }
        
        
        
    }
}
