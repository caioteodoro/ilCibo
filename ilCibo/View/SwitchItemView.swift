//
//  SwitchItemView.swift
//  Cibber
//
//  Created by Caio Teodoro on 15/12/22.
//

import SwiftUI

struct SwitchItemView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var allItems: FetchedResults<Item>
    @State var currentItems: [Item] = []
    
    @Binding var type: FoodTypes
    
    @Binding var selectedProtein: FoodItem
    @Binding var selectedCarb: FoodItem
    @Binding var selectedVegetable: FoodItem
    @Binding var selectedSalad: FoodItem
    
    var body: some View {
        
        VStack {
            
            Spacer().frame(height: 20)
            
            HStack {
                Image(getIcon())
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                Text(getTitle())
                    .font(.title)
                    .foregroundColor(getColor())
            }
            if getCurrentItems().isEmpty {
                
                VStack {
                    Spacer()
                    Text("Não há nada aqui.")
                    Text("Adicione um novo alimento nesta categoria para ter mais opções.")
                    Image("SadBread")
                    Spacer()
                }
                .foregroundColor(.gray)
                
                
            } else {
                
                List {
                    ForEach(getCurrentItems()) { item in
                        if item.type == getTitle() {
                            
                            Button(item.name ?? ""){
                                changeItem(name: item.name ?? "")
                                self.dismiss()
                            }
                            .tint(.black)

                        }
                    }
                }
            }
        }
        
        Button("Cancelar") {
            dismiss()
        }
        .tint(.pastelBlue)
        .frame(height: 50)
    }
    
    func getCurrentItems() -> [Item] {
        
        var currentItems: [Item] = []
        
        for item in allItems {
            if item.type == getTitle() {
                currentItems.append(item)
            }
        }
        return currentItems
    }
    
    func changeItem(name: String){
        switch type {
        case .carb:
            selectedCarb = FoodItem(name: name, type: .carb)
        case .protein:
            selectedProtein = FoodItem(name: name, type: .protein)
        case .salad:
            selectedSalad = FoodItem(name: name, type: .salad)
        case .vegetable:
            selectedVegetable = FoodItem(name: name, type: .vegetable)
        case .none:
            break
        }
    }
    
    func getIcon() -> String {
        switch type {
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
    
    func getTitle() -> String {
        switch type {
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
    
    func getColor() -> Color {
        switch type {
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
    
}
