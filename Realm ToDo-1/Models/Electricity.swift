//
//  Electricity.swift
//  Realm ToDo-1
//
//  Created by Adarsh Raghav on 12/05/23.
//

import SwiftUI
import RealmSwift

class electricityUnits: Object, ObjectKeyIdentifiable {
    let date = NSDate()
    @Persisted(primaryKey: true) var Datetoday: String
    @Persisted var Gvalue: Int = 0
    @Persisted var Fvalue: Int = 0
    @Persisted var Svalue: Int = 0
    
    convenience init(dateToday: String, gValue: Int, fValue: Int, sValue: Int){
        self.init()
        self.Datetoday = dateToday
        self.Gvalue = gValue
        self.Fvalue = fValue
        self.Svalue = sValue
    }
}
