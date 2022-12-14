//
//  TodayView.swift
//  Cibber
//
//  Created by Caio Teodoro on 08/12/22.
//

import SwiftUI

struct TodayView: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State var selectedProtein = FoodItem(name: "", type: .protein)
    @State var selectedSalad = FoodItem(name: "", type: .salad)
    @State var selectedGreenery = FoodItem(name: "", type: .greenery)
    @State var selectedCarbo = FoodItem(name: "", type: .carbo)
    
    var body: some View {
        
        VStack(spacing: 20){
            
            VStack (alignment: .leading) {
                
                Text("")
                    .frame(width: 160)
                    .padding()
                    .overlay(
                     RoundedRectangle(cornerRadius: 16)
                        .stroke(.blue, lineWidth: 4)
                    )
                VStack {
                    Text("Proteína")
                        .foregroundColor(.blue)
                        .font(.system(size: 14, weight: .semibold))
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                }
                .background(.white)
                .padding(EdgeInsets(top: -64, leading: 16, bottom: 0, trailing: 16))
                
                Text(selectedProtein.name)
                    .frame(width: 160)
                    .padding(EdgeInsets(top: -53, leading: 16, bottom: 0, trailing: 0))

            }
            
            
            Text(selectedSalad.name)
            Text(selectedGreenery.name)
            Text(selectedCarbo.name)
            Button("Cibbo di oggi!") {
                raffleItems()
            }
            .frame(width: 200, height: 40)
            .background(Color(uiColor: .pastelBlue))
            .tint(.white)
            .cornerRadius(12)
            
        }
        
        
    }
    
    func raffleItems(){
        
        var allProteins: [FoodItem] = []
        var allSalads: [FoodItem] = []
        var allGreeneries: [FoodItem] = []
        var allCarbos: [FoodItem] = []
        
        for item in items {
            
            switch item.type {
            case "Carboidrato":
                allCarbos.append(FoodItem(name: item.name ?? "",
                                          type: .carbo))
            case "Proteína":
                allProteins.append(FoodItem(name: item.name ?? "",
                                            type: .protein))
            case "Salada":
                allSalads.append(FoodItem(name: item.name ?? "",
                                          type: .salad))
            case "Verdura":
                allGreeneries.append(FoodItem(name: item.name ?? "",
                                              type: .greenery))
            case .none:
                break
            case .some(_):
                break
                
            }
            
        }
        
        if !allProteins.isEmpty {
            self.selectedProtein = allProteins.randomElement()!
        }
        if !allCarbos.isEmpty {
            self.selectedCarbo = allCarbos.randomElement()!
        }
        if !allGreeneries.isEmpty {
            self.selectedGreenery = allGreeneries.randomElement()!
        }
        if !allSalads.isEmpty {
            self.selectedSalad = allSalads.randomElement()!
        }
        
    }
    
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
