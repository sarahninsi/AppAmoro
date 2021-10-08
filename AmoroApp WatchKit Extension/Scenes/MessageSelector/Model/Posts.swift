//
//  Posts.swift
//  Amoro-app WatchKit Extension
//
//  Created by Vinícius Pinheiro on 04/03/21.
//

import Foundation
import SwiftUI

class Posts: Identifiable {
    var id: Int
    var text:String
    var title:String
    
    init(title:String? = nil, id:Int, text:String) {
        self.title = title ?? ""
        self.id = id
        self.text = text
    }
    
    
    static let cute = [
        Posts(title: "Fofas", id: 0, text: "Eu te amo, bebê"),
        Posts(id: 1, text: "Você é meu neném"),
        Posts(id: 2, text: "Tô pensando em você"),
        Posts(id: 3, text: "Tô com saudades"),
        Posts(id: 4, text: "Você alegra meu coração"),
        Posts(id: 5, text: "Você é muito importante"),
        Posts(id: 6, text: "Eu amo seu jeito"),
        Posts(id: 7, text: "Quero você para sempre")
    ]
    
    static let comic = [
        Posts(title: "Cômicas", id: 0, text: "Se você abrir a boca sai miau"),
    ]
    
    static let poke = [
        Posts(title: "Pedidos", id: 0, text: "Vamos nos ver?"),
        Posts(id: 1, text: "Vamos comer?"),
        Posts(id: 2, text: "Deixa eu cuidar de ti"),
        Posts(id: 3, text: "Vamos ficar juntinhos?"),
        Posts(id: 4, text: "Vamos conversar um pouco?"),
        Posts(id: 5, text: "Me deixa só, por favor"),
        Posts(id: 6, text: "Posso te ver?"),
        Posts(id: 7, text: "Deixa eu te dar um beijo?")
    ]
    
    static let hot = [
        Posts(title: "Ousadas", id: 0, text: "Vamos ali testar um negócio?"),
        Posts(id: 1, text: "Ei, psiu..."),
        Posts(id: 2, text: "Se você quiser eu quero"),
        Posts(id: 3, text: "Você é uma delícia"),
        Posts(id: 4, text: "Hoje tem..."),
        Posts(id: 5, text: "Você me da água na boca"),
        Posts(id: 6, text: "Estou só..."),
    ]
    
}
