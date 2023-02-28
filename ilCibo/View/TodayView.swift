//
//  TodayView.swift
//  Cibber
//
//  Created by Caio Teodoro on 08/12/22.
//

import SwiftUI

struct TodayView: View, EnvironmentKey {
    
    static let defaultValue: (() -> Void)? = nil
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State var presentSwitchItemView = false
    @State var typeOfSwitchedItem: FoodTypes = .none
    
    @State var allProteins: [FoodItem] = []
    @State var allSalads: [FoodItem] = []
    @State var allVegetables: [FoodItem] = []
    @State var allCarbs: [FoodItem] = []
    
    @State var selectedProtein = FoodItem(name: "", type: .protein)
    @State var selectedSalad = FoodItem(name: "", type: .salad)
    @State var selectedVegetable = FoodItem(name: "", type: .vegetable)
    @State var selectedCarb = FoodItem(name: "", type: .carb)
    
    var body: some View {
        
        VStack(spacing: 20){
            
            ClickableItem(changeItemFunction: { self.changeItem(type: .protein) },
                          shuffleFunction: { self.raffleItem(type: .protein) },
                          removeFunction: { self.removeItem(type: .protein) },
                          todaysChoicesCell: TodaysChoicesCell(item: selectedProtein))
            ClickableItem(changeItemFunction: { self.changeItem(type: .salad) },
                          shuffleFunction: { self.raffleItem(type: .salad) },
                          removeFunction: { self.removeItem(type: .salad) },
                          todaysChoicesCell: TodaysChoicesCell(item: selectedSalad))
            ClickableItem(changeItemFunction: { self.changeItem(type: .carb) },
                          shuffleFunction: { self.raffleItem(type: .carb) },
                          removeFunction: { self.removeItem(type: .carb) },
                          todaysChoicesCell: TodaysChoicesCell(item: selectedCarb))
            ClickableItem(changeItemFunction: { self.changeItem(type: .vegetable) },
                          shuffleFunction: { self.raffleItem(type: .vegetable) },
                          removeFunction: { self.removeItem(type: .vegetable) },
                          todaysChoicesCell: TodaysChoicesCell(item: selectedVegetable))
            
            Spacer().frame(height: 20)
            
            Button("shuffle") {
                populateTypeArrays()
                raffleAll()
            }
            .frame(width: 248, height: 40)
            .background(Color.pastelBlue)
            .tint(.white)
            .cornerRadius(16)
            
        }
        .sheet(isPresented: $presentSwitchItemView) {
            SwitchItemView(type: self.$typeOfSwitchedItem,
                           selectedProtein: self.$selectedProtein,
                           selectedCarb: self.$selectedCarb,
                           selectedVegetable: self.$selectedVegetable,
                           selectedSalad: self.$selectedSalad)
        }
        
    }
    
    func populateTypeArrays() {
        
        for item in items {
            
            switch item.type {
            case "carb":
                allCarbs.append(FoodItem(name: item.name ?? "",
                                          type: .carb))
            case "protein":
                allProteins.append(FoodItem(name: item.name ?? "",
                                            type: .protein))
            case "salad":
                allSalads.append(FoodItem(name: item.name ?? "",
                                          type: .salad))
            case "vegetable":
                allVegetables.append(FoodItem(name: item.name ?? "",
                                              type: .vegetable))
            case .none:
                break
            case .some(_):
                break
            }
        }
    }
    
    func changeItem(type: FoodTypes){
        typeOfSwitchedItem = type
        presentSwitchItemView.toggle()
    }
    
    func raffleItem(type: FoodTypes){
        switch type {
        case .carb:
            if !allCarbs.isEmpty {
                self.selectedCarb = allCarbs.randomElement()!
            }
        case .protein:
            if !allProteins.isEmpty {
                self.selectedProtein = allProteins.randomElement()!
            }
        case .salad:
            if !allSalads.isEmpty {
                self.selectedSalad = allSalads.randomElement()!
            }
        case .vegetable:
            if !allVegetables.isEmpty {
                self.selectedVegetable = allVegetables.randomElement()!
            }
        case .none:
            break
        }
    }
    
    func raffleAll(){
        for type in FoodTypes.allCases {
            raffleItem(type: type)
        }
    }
    
    func removeItem(type: FoodTypes){
        switch type {
        case .carb:
            selectedCarb = FoodItem(name: "", type: .carb)
        case .protein:
            selectedProtein = FoodItem(name: "", type: .protein)
        case .salad:
            selectedSalad = FoodItem(name: "", type: .salad)
        case .vegetable:
            selectedVegetable = FoodItem(name: "", type: .vegetable)
        case .none:
            break
        }
    }
    
    struct ClickableItem: View {
        
        var changeItemFunction: () -> Void
        var shuffleFunction: () -> Void
        var removeFunction: () -> Void
        var todaysChoicesCell: TodaysChoicesCell
        
        var body: some View {
            
            Menu {
                
                Button(action: {
                    self.changeItemFunction()
                }) { Label("select", systemImage: "list.bullet") }
                
                Button(action: {
                    self.shuffleFunction()
                }) { Label("shuffle", systemImage: "shuffle") }
                
                Button(action: {
                    self.removeFunction()
                }) { Label("remove", systemImage: "trash") }
                
            } label: {
                todaysChoicesCell
            }
            
        }
        
    }
    
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
