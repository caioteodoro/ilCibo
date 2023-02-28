//
//  OptionsView.swift
//  Cibber
//
//  Created by Caio Teodoro on 08/12/22.
//

import SwiftUI

struct ListWithAllOptionsView: View {
    
    @State private var newFoodSheet = false
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State var itemName = ""
    
    var foodGroup: [FoodItem] = []
    
    
    var body: some View {
        
        
        
        NavigationView {
            
            List {
                
                Section(header: HStack {
                    Image("Carb")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                    Text("carbs")
                }) {
                    
                    ForEach(items) { item in
                        
                        if item.type == "carb" {
                            NavigationLink (destination: EditFoodView(foodItem: FoodItem(name: item.name!, type: .carb)), label: {
                                Text(item.name ?? "")
                            })
                        }
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                
                Section(header: HStack {
                    Image("Protein")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                    Text("proteins")
                }) {
                    
                    ForEach(items) { item in
                        
                        if item.type == "protein" {
                            NavigationLink (destination: EditFoodView(foodItem: FoodItem(name: item.name!, type: .protein)), label: {
                                Text(item.name ?? "")
                            })
                        }
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                
                Section(header: HStack {
                    Image("Salad")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                    Text("salads")
                }) {
                    
                    ForEach(items) { item in
                        
                        if item.type == "salad" {
                            NavigationLink (destination: EditFoodView(foodItem: FoodItem(name: item.name!, type: .salad)), label: {
                                Text(item.name ?? "")
                            })
                        }
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                
                Section(header: HStack {
                    Image("Vegetable")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                    Text("vegetables")
                }) {
                    
                    ForEach(items) { item in
                        
                        if item.type == "vegetable" {
                            NavigationLink (destination: EditFoodView(foodItem: FoodItem(name: item.name!, type: .vegetable)), label: {
                                Text(item.name ?? "")
                            })
                        }
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                
                
            }
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        newFoodSheet.toggle()
                    } label:  {
                        Label("Add", systemImage: "plus")
                    }
                    .sheet(isPresented: $newFoodSheet) {
                        NewFoodView()
                    }
                }
            }
            
            
            
            Text("Select an item")
        }
        
    }
    

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        ListWithAllOptionsView()
    }
}
