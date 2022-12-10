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
    @State var itemTypeLabel = "Selecione o tipo"
    
    var body: some View {
        
        
        VStack {
            
            TextField("Digite o nome aqui", text: self.$itemName)
                .multilineTextAlignment(TextAlignment.center)
                .frame(width: 200, height: 40)
                .background(Color(uiColor: .systemGray6))
                .cornerRadius(12)
            
            Menu(itemTypeLabel){
                Button("Carboidrato", action: {
                    itemType = .carbo
                    setMenuLabel()
                })
                Button("Proteína", action: {
                    itemType = .protein
                    setMenuLabel()
                } )
                Button("Verdura", action: {
                    itemType = .greenery
                    setMenuLabel()
                })
                Button("Salada", action: {
                    itemType = .salad
                    setMenuLabel()
                })
            }
            .frame(width: 200, height: 40)
            .background(.blue)
            .tint(.white)
            .cornerRadius(12)
            .pickerStyle(.menu)
            
            Button("Adicionar") {
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
        case .carbo:
            itemTypeLabel = "Carboidrato"
        case .protein:
            itemTypeLabel = "Proteína"
        case .salad:
            itemTypeLabel = "Salada"
        case .greenery:
            itemTypeLabel = "Verdura"
        case .none:
            itemTypeLabel = "Selecione o tipo"
        }
    }
}

struct NewFoodView_Previews: PreviewProvider {
    static var previews: some View {
        NewFoodView()
    }
}
