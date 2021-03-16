//
//  BigAlertView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct PairingView: View {
    var body: some View {
        GeometryReader { proxy in
            if proxy.size.width > 324/2.0 { // 40mm watch resolution in points
                VStack {
                    ScrollView {
                        Image("Sample")
                            .resizable()
                            .padding(.top)
                            .frame(width: 80, height: 80)
                        Text("Você e seu amor")
                            .multilineTextAlignment(.center)
                            .font(.custom("SF Compact Rounded Regular", size: 17))
                        Text("agora estão")
                            .font(.custom("SF Compact Rounded Regular", size: 17))
                        Text("conectados")
                            .font(.custom("SF Compact Rounded Bold", size: 17))
                            .padding(.bottom)
                        NavigationLink(destination: MenuCategoryView()) {
                            Text("Fechar")
                            
                        }
                        .background(Color("Secundary Button"))
                        .cornerRadius(15)
                        .padding(.trailing, 16)
                        .padding(.leading, 16)
                    }
                }
                
            } else {
                ScrollView {
                    VStack {
                        Image("Sample")
                            .resizable()
                            .padding(.top)
                            .frame(width: 80, height: 80)
                        Text("Você e seu amor")
                            .multilineTextAlignment(.center)
                            .font(.custom("SF Compact Rounded Regular", size: 17))
                        Text("agora estão")
                            .font(.custom("SF Compact Rounded Regular", size: 17))
                        Text("conectados")
                            .font(.custom("SF Compact Rounded Bold", size: 17))
                        NavigationLink(destination: MenuCategoryView()) {
                            Text("Fechar")
                                .font(.custom("SF Compact Rounded Regular", size: 17))
                            
                        }
                        .background(Color("Secundary Button"))
                        .cornerRadius(15)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                    }
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

struct PairingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PairingView()
            PairingView()
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
