//
//  SendView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct SendView: View {
    @State private var roomNumber = UserDefaults.standard.integer(forKey: "room")
    var body: some View {
        GeometryReader { proxy in
            if proxy.size.width > 324/2.0 { // 40mm watch resolution in points
                VStack {
                    Image("sendedIcon")
                        .resizable()
                        .padding(.top)
                        .frame(width: 60, height: 54)
                    Text("Sua mensagem")
                        .multilineTextAlignment(.center)
                        .font(.custom("SF Compact Rounded Regular", size: 17))
                    HStack {
                        Text("enviada")
                            .font(.custom("SF Compact Rounded Bold", size: 17))
                        Text("para o seu")
                            .font(.custom("SF Compact Rounded Regular", size: 17))
                    }
                    Text("amor")
                        .font(.custom("SF Compact Rounded Regular", size: 17))
                        .padding(.bottom)
                    NavigationLink(destination: MenuCategoryView(roomNumber: roomNumber)) {
                        Text("Fechar")
                            .font(.custom("SF Compact Rounded Regular", size: 17))
                            
                    }
                    .background(Color("Secundary Button"))
                    .cornerRadius(15)
                    .padding(.trailing, 12)
                    .padding(.leading, 12)
                }
                
            } else {
                ScrollView {
                    VStack {
                        Image("sendedIcon")
                            .resizable()
                            .padding(.top)
                            .frame(width: 60, height: 54)
                        Text("Sua Mensagem")
                            .multilineTextAlignment(.center)
                            .font(.custom("SFCompactRounded", size: 17))
                        HStack {
                            Text("enviada")
                                .bold()
                                .font(.system(size: 17))
                            Text("para o seu")
                                .font(.custom("SFCompactRounded", size: 17))                        }
                        Text("amor")
                            .font(.custom("SFCompactRounded", size: 17))
                            .padding(.bottom)
                        
                        NavigationLink(destination: MenuCategoryView(roomNumber: roomNumber)) {
                            
                            Text("Fechar")
                                
                        }
                        .background(Color("Secundary Button"))
                        .cornerRadius(15)
                        .padding(.trailing, 8)
                        .padding(.leading, 8)
                    }
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}
