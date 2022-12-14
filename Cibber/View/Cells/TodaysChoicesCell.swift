//
//  TodaysChoicesCell.swift
//  Cibber
//
//  Created by Caio Teodoro on 13/12/22.
//

import SwiftUI

struct TodaysChoicesCell: View {
    
    var item: FoodItem
    
    func getTypeName() -> String {
        switch item.type {
        case .carbo:
            return "Carboidrato"
        case .protein:
            return "Proteína"
        case .salad:
            return "Salada"
        case .greenery:
            return "Verdura"
        case .none:
            return ""
        }
    }
    
    func getTypeIcon() -> String {
        switch item.type {
        case .carbo:
            return "Carbo"
        case .protein:
            return "Protein"
        case .salad:
            return "Salad"
        case .greenery:
            return "Greenery"
        case .none:
            return ""
        }
    }
    
    func getTypePastelColor() -> Color {
        switch item.type {
        case .carbo:
            return .pastelPurple
        case .protein:
            return .pastelOrange
        case .salad:
            return .pastelRed
        case .greenery:
            return .pastelGreen
        case .none:
            return .white
        }
    }
    
    func getTypeDarkColor() -> Color {
        switch item.type {
        case .carbo:
            return .darkPurple
        case .protein:
            return .darkOrange
        case .salad:
            return .darkRed
        case .greenery:
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
                    Text(getTypeName())
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
