//
//  CategoryFramePurple.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct CategoryFramePurple: View {
    let categoryName:String
    let iconName:String
    
    var body: some View {
        
        ZStack {
            VStack {
                Text(categoryName)
                    .font(.custom("SF Compact Rounded Semibold", size: 14))
                    .foregroundColor(.white)
                    .padding(.trailing, categoryName == "Fofas" ? 24 : 9)
                Image(iconName)
                    .resizable()
                    .frame(width: iconName == "cuteIcon" ? 36 : 40, height: iconName == "cuteIcon" ? 35.5 : 35, alignment: .center)
                    .padding(.leading, 20)
            }
            .frame(width: 75, height: 75)
            .background(Color("Button 1"))
            .cornerRadius(12)
        }
    }
}

struct CategoryFramePurple_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFramePurple(categoryName: "Fofas", iconName: "Sample")
    }
}
