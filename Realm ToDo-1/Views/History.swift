//
//  History.swift
//  Realm ToDo-1
//
//  Created by Adarsh Raghav on 13/05/23.
//

import SwiftUI
import RealmSwift



struct History: View {
    @ObservedResults(electricityUnits.self) var eUnits
    @State private var searchFilter = ""
    
    
    var body: some View {
        NavigationView{
            VStack{
                List(){
                    ForEach(eUnits){
                        unit in UnitsRow(Units: unit).listRowSeparator(.hidden)
                        Spacer()
                    }
                    .listStyle(.plain)
                    .searchable(text: $searchFilter, collection: $eUnits, keyPath: \.Datetoday){
                        ForEach(eUnits){
                            unit in UnitsRow(Units: unit).listRowSeparator(.hidden)
                        }
                    }
                }
            }
        }.navigationTitle("Electricity Units")
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
