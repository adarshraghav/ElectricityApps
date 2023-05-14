//
//  PriceView.swift
//  Realm ToDo-1
//
//  Created by Adarsh Raghav on 14/05/23.
//

import SwiftUI
import RealmSwift

struct PriceView: View {
    var body: some View {
        let realm = try! Realm()
        let units = realm.objects(electricityUnits.self)
        let latestUnit = units[units.count-1]
        let secondUnit = units[units.count-2]
        let cal = Calendar(identifier: .gregorian)
        let monthRange = cal.range(of: .day, in: .month, for: Date())!
        let daysInMonth = monthRange.count
        ZStack(){
            RoundedRectangle(cornerRadius: 25, style: .continuous).fill(.white).shadow(radius: 2)
//                        HStack{}
            HStack{
                Button(){}label:{
                    Image(systemName: "calendar.circle.fill").foregroundColor(.indigo)
                    Text(Date().formatted(date: .numeric, time:.omitted))
                }.offset(x:-35)
                Text("Electricity Charges").italic().fontWeight(.thin).offset(x:30)
            }.offset(y:-85)
            Spacer().frame(minHeight: 2, idealHeight: 2, maxHeight: 2).fixedSize()
            VStack {
                Text("Current Meter Readings   = \(latestUnit.Svalue)kWh").multilineTextAlignment(.leading).offset(x:1)
                Text("Previous Meter Readings = \(secondUnit.Svalue)kWh").offset(x:-5)
                Text("Units Consumed                = \(latestUnit.Svalue-secondUnit.Svalue)kWh").offset(x:1)
                Text("Water Pump Units             = \(daysInMonth)kWh").multilineTextAlignment(.leading).offset(x:-5.5)
                Text("Total Units consumed       = \((latestUnit.Svalue-secondUnit.Svalue)+daysInMonth)kWh").offset(x:0)
                Spacer().frame(minHeight: 15, idealHeight: 15, maxHeight: 15).fixedSize()
                Text("Amount = \((latestUnit.Svalue-secondUnit.Svalue)-daysInMonth) x 9.0 = ₹ \((latestUnit.Svalue-secondUnit.Svalue)+daysInMonth*9)").bold()
            }.offset(y:0)
        }.frame(width: 350, height:225)
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView()
    }
}
