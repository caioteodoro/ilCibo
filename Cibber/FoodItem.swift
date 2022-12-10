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
    }
    
    var name: String
    var type: FoodTypes
    
}
