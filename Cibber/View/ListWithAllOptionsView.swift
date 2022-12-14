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
                    Image("Carbo")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                    Text("Carboidratos")
                }) {
                    
                    ForEach(items) { item in
                        
                        if item.type == "Carboidrato" {
                            NavigationLink (destination: EditFoodView(foodItem: FoodItem(name: item.name!, type: .carbo)), label: {
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
                    Text("Proteínas")
                }) {
                    
                    ForEach(items) { item in
                        
                        if item.type == "Proteína" {
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
                    Text("Saladas")
                }) {
                    
                    ForEach(items) { item in
                        
                        if item.type == "Salada" {
                            NavigationLink (destination: EditFoodView(foodItem: FoodItem(name: item.name!, type: .salad)), label: {
                                Text(item.name ?? "")
                            })
                        }
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                
                Section(header: HStack {
                    Image("Greenery")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                    Text("Verduras")
                }) {
                    
                    ForEach(items) { item in
                        
                        if item.type == "Verdura" {
                            NavigationLink (destination: EditFoodView(foodItem: FoodItem(name: item.name!, type: .greenery)), label: {
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
