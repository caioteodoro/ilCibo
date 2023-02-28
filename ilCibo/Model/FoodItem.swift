//
//  FoodItem.swift
//  Cibber
//
//  Created by Caio Teodoro on 09/12/22.
//

import Foundation
import SwiftUI

struct FoodItem {
    
    internal init(name: String, type: FoodTypes) {
        self.name = name
        self.type = type
        
        switch type {
        case .carb:
            self.icon = "Carb"
        case .protein:
            self.icon = "Protein"
        case .salad:
            self.icon = "Salad"
        case .vegetable:
            self.icon = "Vegetable"
        case .none:
            self.icon = ""
        }
    }
    
    var name: String
    var type: FoodTypes
    var icon: String
    
}
