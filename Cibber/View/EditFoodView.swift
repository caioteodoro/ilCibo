//
//  EditFoodView.swift
//  Cibber
//
//  Created by Caio Teodoro on 09/12/22.
//

import SwiftUI

struct EditFoodView: View {
    
    var foodItem: FoodItem
    
    var body: some View {
        
        VStack (spacing: 20){
            Image(foodItem.icon)
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            
            Text(foodItem.name)
                .font(.title)
            
        }

    }
}

struct EditFoodView_Previews: PreviewProvider {
    static var previews: some View {
        EditFoodView(foodItem: FoodItem(name: "Cenoura", type: .carbo))
    }
}
