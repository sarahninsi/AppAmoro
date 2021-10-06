//
//  ContentView.swift
//  AmoroApp WatchKit Extension
//
//  Created by Sarah Ninsi Abreu de Almeida on 16/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userCode = Int.random(in: 1..<10000)
    @State private var partnerCode = ""
    @State private var existCode = true
    @State private var existRoom = false
    @State private var isFirstBuild = true
    @State private var pushActive = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Adicione o código do seu amor")
                    .multilineTextAlignment(.leading)
                    .font(.custom("SF Compact Rounded Medium", size: 30))
                
                
                Spacer()
                    .frame(height: 12)
                
                TextField("", text: $partnerCode, onCommit: {
                    guard let partnerCodeInt = Int(partnerCode) else {
                        return
                        
                    }
                    var coupleRoom = CoupleRoom(roomNumber: partnerCodeInt, isOccupied: 0)
                    coupleRoom.readRecords { (records, error) in
                        if error != nil {
                            print("Não foi")
                        } else {
                            for room in records ?? [] {
                                if (partnerCodeInt == Int(room.roomNumber)) {
                                    existRoom = true
                                    coupleRoom = CoupleRoom(roomNumber: partnerCodeInt, isOccupied: 1)
                                    coupleRoom.createRecord { (error) in
                                        if(error == nil) {
                                            print("Foi")
                                            self.pushActive = true
                                            UserDefaults.standard.setValue(partnerCodeInt, forKey: "room")
                                            
                                        } else {
                                            print("Não foi")
                                        }
                                    }
                                }
                            }
                            print("Foi")
                        }
                    }
                    
                })
                .padding()
                NavigationLink(destination: PairingView(), isActive: self.$pushActive) {
                  Text("")
                }
                .hidden()
                .frame(width: 0, height: 0)
                
                Spacer()
                    .frame(height: 12)
                Divider()
                Spacer()
                    .frame(height: 12)
                HStack {
                    Text("Seu código é")
                        .font(.custom("SF Compact Rounded Regular", size: 14))
                        .foregroundColor(Color("Tertiary Text"))
                    Text(String(userCode))
                        .font(.custom("SF Compact Rounded Bold", size: 14))
                }
            }
            
        }
        .onAppear(perform: {
            if(isFirstBuild) {
                isFirstBuild = false
                var coupleRoom = CoupleRoom(roomNumber: userCode, isOccupied: 0)
                coupleRoom.readRecords { (records, error) in
                    if error != nil {
                        print("Não foi")
                    } else {
                        while (existCode) {
                            existCode = false
                            for room in records ?? [] {
                                if(userCode == Int(room.roomNumber)) {
                                    existCode = true
                                    userCode = Int.random(in: 1..<10000)
                                    print(String(existCode))
                                    continue
                                } else {
                                    print(String(existCode))
                                }
                            }
                        }
                        coupleRoom = CoupleRoom(roomNumber: userCode, isOccupied: 0)
                        coupleRoom.createRecord { (error) in
                            if error == nil {
                                print("foi")
                            } else {
                                print("não foi")
                            }
                        }
                    }
                }
            }
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
