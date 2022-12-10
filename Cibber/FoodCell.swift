//
//  FoodCell.swift
//  Cibber
//
//  Created by Caio Teodoro on 09/12/22.
//

import Foundation
import SwiftUI

struct FoodCell: View {
    
    var itemName: String
    var itemType: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(itemName)
            Text(itemType)
                    .foregroundColor(Color(uiColor: .systemGray))
                    .font(.caption)
        }
    }
    
    internal init(itemName: String, itemType: String) {
        self.itemName = itemName
        self.itemType = itemType
    }
    
}
