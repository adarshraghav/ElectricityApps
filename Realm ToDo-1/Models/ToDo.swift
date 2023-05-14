//
//  ToDo.swift
//  Realm ToDo-1
//
//  Created by Adarsh Raghav on 06/05/23.
//

import SwiftUI
import RealmSwift

class ToDo: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var completed = false
    @Persisted var urgency: Urgency = .nuetral
    
    enum Urgency: Int, PersistableEnum {
        case trivial, nuetral, urgent
        var text: String {
            switch self{
            case .trivial:
                return "Trivial"
            case .nuetral:
                return "Nuetral"
            case .urgent:
                return "Urgent"
            }
        }
        
        var color: Color {
            switch self{
            case .trivial:
                return .teal
            case .nuetral:
                return .secondary
            case .urgent:
                return .red
            }
        }
    }
    
    func increment() -> Urgency {
        switch urgency {
        case .trivial:
            return .nuetral
        case .nuetral:
            return .urgent
        case .urgent:
            return .trivial
        }
    }
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
}
