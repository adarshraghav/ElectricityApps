//
//  SwiftUIView.swift
//  Realm ToDo-1
//
//  Created by Adarsh Raghav on 13/05/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        TabView {
            UnitsView()
                .tabItem {
                    Label("New Entry", systemImage: "note.text.badge.plus")
            }
            History()
                .tabItem {
                    Label("History", systemImage: "server.rack")
                }
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
