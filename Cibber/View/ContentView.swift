//
//  ContentView.swift
//  Cibber
//
//  Created by Caio Teodoro on 08/12/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var selectedView = 1
    var body: some View {
        
        TabView(selection: $selectedView) {
            
            TodayView().tabItem {
                Image(systemName: "calendar.circle")
                Text("Hoje") }.tag(1)
            
            ListWithAllOptionsView().tabItem {
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
