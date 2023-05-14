//
//  UnitsRow.swift
//  Realm ToDo-1
//
//  Created by Adarsh Raghav on 12/05/23.
//

import SwiftUI
import RealmSwift

struct UnitsRow: View {
    @ObservedRealmObject var Units: electricityUnits
    var body: some View {
        VStack{
            HStack{
                Button{
                } label: {
                    Image(systemName: "calendar.circle.fill")
                    Text("\(Units.Datetoday)")
                }.buttonStyle(.bordered)
            }
            HStack{
                Button{
                } label: {
                    Image(systemName: "g.square.fill").foregroundColor(.indigo)
                    Text("\(Units.Gvalue) kWh")
                }.buttonStyle(.plain)
                Button{
                } label: {
                    Image(systemName: "f.square.fill").foregroundColor(.indigo)
                    Text("\(Units.Fvalue) kWh")
                }.buttonStyle(.plain)
                Button{
                } label: {
                    Image(systemName: "s.square.fill").foregroundColor(.indigo)
                    Text("\(Units.Svalue) kWh")
                }.buttonStyle(.plain)
            }.padding()
        }
    }
}

struct UnitsRow_Previews: PreviewProvider {
    static var previews: some View {
        UnitsRow(Units: electricityUnits())
    }
}
