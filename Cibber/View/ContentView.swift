//
//  ContentView.swift
//  Cibber
//
//  Created by Caio Teodoro on 08/12/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    

    var body: some View {
        
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            
            TodayView().tabItem {
                Image(systemName: "calendar.circle")
                Text("Hoje") }.tag(1)
            
            OptionsView().tabItem {
                Image(systemName: "fork.knife.circle")
                Text("Opções") }.tag(2)
        }
        
    }

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
