//
//  NewFoodView.swift
//  Cibber
//
//  Created by Caio Teodoro on 08/12/22.
//

import SwiftUI

struct NewFoodView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var itemName = ""
    @State var itemType: FoodTypes = .none
    @State var itemTypeLabel = "select_type"
    
    var body: some View {
        
        
        VStack {
            
            TextField("type_name_here", text: self.$itemName)
                .multilineTextAlignment(TextAlignment.center)
                .frame(width: 200, height: 40)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(12)
            
            Menu(LocalizedStringKey(itemTypeLabel)){
                Button("carb", action: {
                    itemType = .carb
                    setMenuLabel()
                })
                Button("protein", action: {
                    itemType = .protein
                    setMenuLabel()
                } )
                Button("vegetable", action: {
                    itemType = .vegetable
                    setMenuLabel()
                })
                Button("salad", action: {
                    itemType = .salad
                    setMenuLabel()
                })
            }
            .frame(width: 200, height: 40)
            .background(.blue)
            .tint(.white)
            .cornerRadius(12)
            .pickerStyle(.menu)
            
            Button("add") {
                addItem()
                if itemType != .none {
                    dismiss()
                }
            }
            .frame(width: 200, height: 40)
            .background(.blue)
            .tint(.white)
            .cornerRadius(12)
        }
        .lineSpacing(20)
        .padding(24)
    }
    
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.name = itemName
            newItem.type = itemTypeLabel

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func setMenuLabel() {
        switch itemType {
        case .carb:
            itemTypeLabel = "carb"
        case .protein:
            itemTypeLabel = "protein"
        case .salad:
            itemTypeLabel = "salad"
        case .vegetable:
            itemTypeLabel = "vegetable"
        case .none:
            itemTypeLabel = "select_type"
        }
    }
}

struct NewFoodView_Previews: PreviewProvider {
    static var previews: some View {
        NewFoodView()
    }
}
