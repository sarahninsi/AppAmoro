//
//  NotificationView.swift
//  AmoroApp WatchKit Extension
//
//  Created by Sarah Ninsi Abreu de Almeida on 16/03/21.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            
            Text("Entre no app e veja o que é")
                .multilineTextAlignment(.center)
            
        }
    }
}

struct SewdwdView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

