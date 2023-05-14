//
//  Realm_ToDo_1App.swift
//  Realm ToDo-1
//
//  Created by Adarsh Raghav on 06/05/23.
//

import SwiftUI

@main
struct Realm_ToDo_1App: App {
    var body: some Scene {
        WindowGroup {
            SwiftUIView()
                .onAppear(){
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintsBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
