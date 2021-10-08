//
//  ContentView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 03/03/21.
//

import SwiftUI

struct CodeLoginView: View {
    
    @State private var userCode = Int.random(in: 1..<10000)
    @State private var partnerCode = ""
    @State private var existCode = true
    @State private var existRoom = false
    @State private var isFirstBuild = true
    @State private var pushActive = false
    @State private var roomsInCloud = [CoupleRoom]()
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Adicione o código do seu amor")
                    .multilineTextAlignment(.leading)
                    .font(.custom("SF Compact Rounded Medium", size: 30))
                
                
                Spacer()
                    .frame(height: 12)
                
                TextField("", text: $partnerCode)
                    .textContentType(.oneTimeCode)
                    .padding()
                    .onChange(of: partnerCode) { newValue in
                        guard let partnerCodeInt = Int(partnerCode) else { return }
                        print("O valor foi convertido com sucesso: \(partnerCodeInt)")
                        for room in roomsInCloud {
                            if partnerCodeInt == room.roomNumber, room.isOccupied == 0 {
                                pushActive = true
                            }
                        }
                    }
                
                
                NavigationLink(destination: PairedView(), isActive: self.$pushActive) {
                    Text("")
                }
                .textContentType(.oneTimeCode)
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
                
                // Fazendo os downloads dos Records
                
                var coupleRoom = CoupleRoom(roomNumber: userCode, isOccupied: 0)
                coupleRoom.readRecords { (records, error) in
                    if error != nil {
                        print("Erro nas leituras de records")
                    } else {
                        guard let numberOfRecords = records?.count else { return }
                        if numberOfRecords > 0 {
                            for room in records! {
                                roomsInCloud.append(CoupleRoom(roomNumber: Int(room.roomNumber), isOccupied: Int(room.isOccupied)))
                            }
                        }
                    }
                }
                
                // Checando se o número do quarto existe
                
                if roomsInCloud.count > 0 {
                    while (existCode) {
                        existCode = false
                        for room in roomsInCloud {
                            if(userCode == room.roomNumber) {
                                existCode = true
                                userCode = Int.random(in: 1..<10000)
                                coupleRoom.roomNumber = userCode
                                print(String(existCode))
                            } else {
                                existCode = false
                            }
                        }
                    }
                }
                
                print(coupleRoom)
                
                // Mandando o Couple Room para a nuvem
                
                coupleRoom.createRecord { (error) in
                    if error == nil {
                        print("Criação do CoupleRoom realizada com sucesso!")
                        self.roomsInCloud.append(coupleRoom)
                    } else {
                        print("Erro na criação do CoupleRoom!")
                    }
                }

            }
        })
    }
    
}

