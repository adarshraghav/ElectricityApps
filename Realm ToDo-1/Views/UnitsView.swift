//
//  UnitsView.swift
//  Realm ToDo-1
//
//  Created by Adarsh Raghav on 12/05/23.
//

import SwiftUI
import RealmSwift

struct UnitsView: View {
    @ObservedResults(electricityUnits.self) var eUnits
    @State private var ground = ""
    @State private var first = ""
    @State private var second = ""
    @State private var dateToday = ""
    @State private var Intground = 0
    @State private var Intfirst = 0
    @State private var Intsecond = 0
    @State private var GfDiff = 0
    @State private var FfDiff = 0
    @State private var SfDiff = 0
    @State var showsCorrectOrIncorrect: Bool = false
    
    func calc() -> (Int, Int, Int){
        let realm = try! Realm()
        let units = realm.objects(electricityUnits.self)
        let latestUnit = units[units.count-1]
        let secondUnit = units[units.count-2]
        return (latestUnit.Gvalue - secondUnit.Gvalue, latestUnit.Fvalue - secondUnit.Fvalue, latestUnit.Svalue - secondUnit.Svalue)
    }
    
    var body: some View {
        let cal = Calendar(identifier: .gregorian)
        let monthRange = cal.range(of: .day, in: .month, for: Date())!
        
        NavigationView {
            VStack(){
                HStack{
                    Button(){}label:{Image(systemName: "g.circle.fill").foregroundColor(.indigo)}
                    TextField("Enter Ground Floor Units...", text: $ground)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .padding()
                }.padding()
                HStack{
                    Button(){}label:{Image(systemName: "f.circle.fill").foregroundColor(.indigo)}
                    TextField("Enter First Floor Units...", text: $first)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .padding()
                }.padding()
                HStack{
                    Button(){}label:{Image(systemName: "s.circle.fill").foregroundColor(.indigo)}
                    TextField("Enter Second Floor Units...", text: $second)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .padding()
                }.padding()
                
                HStack{
                    Button("Submit"){
                        let today = Date()
                        dateToday = today.formatted(date: .numeric, time:.omitted)
                        Intground = Int(ground) ?? 0
                        Intfirst = Int(first) ?? 0
                        Intsecond = Int(second) ?? 0
                        let newUnits = electricityUnits(dateToday: dateToday, gValue: Intground, fValue: Intfirst, sValue: Intsecond)
                        $eUnits.append(newUnits)
                    }
                    .disabled(ground.isEmpty || first.isEmpty || second.isEmpty)
                    .padding()
                    
                    Button("Calculate"){
                        (GfDiff, FfDiff, SfDiff) = calc()
                        showsCorrectOrIncorrect = true
                    }
                    .clipShape(Capsule())
                    .background(.white)
                    .padding()
                }
                if showsCorrectOrIncorrect {
                    ZStack{
                        PriceView()
                        Button(){
                            guard let image = ImageRenderer(content: PriceView()).uiImage else {
                                return
                            }
                            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        }label:{
                            Image(systemName: "square.and.arrow.up.circle.fill").foregroundColor(.indigo).scaleEffect(1.5)
                        }.offset(x:140, y:85)
                    }
                }
                else{
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.white)
                        HStack {
                            Button(){}
                            label:{
                                Image(systemName: "bell.and.waves.left.and.right.fill").foregroundColor(.indigo)
                                Text("All caught up! Click on calculate")
                            }.buttonStyle(.plain)
                        }
                        .padding(20)
                        .multilineTextAlignment(.center)     
                    }
                }
                Spacer()
            }
            .navigationTitle("Electricity Units")
        }
    }
}

struct UnitsView_Previews: PreviewProvider {
    static var previews: some View {
        UnitsView()
    }
}
