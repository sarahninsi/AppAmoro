//
//  MenuCategoryView.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import SwiftUI

struct MenuCategoryView: View {
    
    let cute = Categories.cuteOption
    let funny = Categories.funnyOption
    let beat = Categories.beatIcon
    let hot = Categories.hotOption

    
    var body: some View {
        
        HStack {
            VStack {
                NavigationLink(destination: MessageSelectionView(categorySelected: Posts.cute)) {
                    CategoryFramePurple(categoryName: cute.text, iconName: cute.image)
                }
                .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                NavigationLink(destination: MessageSelectionView(categorySelected: Posts.poke)) {
                    CategoryFramePink(categoryName: beat.text, iconName: beat.image)
                }
                .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            VStack {
                NavigationLink(destination: MessageSelectionView(categorySelected: Posts.hot)) {
                    CategoryFramePink(categoryName: hot.text, iconName: hot.image)
                }
                .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                NavigationLink(destination: MessageSelectionView(categorySelected: Posts.comic)) {
                    CategoryFramePurple(categoryName: funny.text, iconName: funny.image)
                }
                .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
        
        .navigationBarBackButtonHidden(true)
        .padding(.top, 20)
        
        
        
        
    }
    
}

struct MenuCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCategoryView()
    }
}
