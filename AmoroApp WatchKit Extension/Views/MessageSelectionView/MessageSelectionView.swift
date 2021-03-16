//
//  MessageSelectionView.swift
//  Amoro-app
//
//  Created by Vinícius Pinheiro on 03/03/21.
//

import SwiftUI

struct MessageSelectionView: View {

    var categorySelected = [Posts]()
    
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(0..<categorySelected.count) { i in
                    NavigationLink(destination: ContentViewFinal(messageImage: "animateIcon", messageText: categorySelected[i].text)) {
                        rowListView(colorRow: categorySelected[i].id, text: categorySelected[i].text)
                    }
                    .frame(width: 164, height: 54, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
            }
            
        }
        .navigationTitle(categorySelected[0].title)
    }
    
    
}

struct MessageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessageSelectionView(categorySelected: Posts.hot)
                .previewDevice("Apple Watch Series 6 - 44mm")
            MessageSelectionView(categorySelected: Posts.hot)
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
