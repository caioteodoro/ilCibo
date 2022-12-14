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
        case .carbo:
            self.icon = "Carbo"
        case .protein:
            self.icon = "Protein"
        case .salad:
            self.icon = "Salad"
        case .greenery:
            self.icon = "Greenery"
        case .none:
            self.icon = ""
            
        let _ = print(icon)
        }
    }
    
    var name: String
    var type: FoodTypes
    var icon: String
    
}
