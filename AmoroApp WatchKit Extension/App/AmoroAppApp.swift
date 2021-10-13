//
//  AmoroAppApp.swift
//  AmoroApp WatchKit Extension
//
//  Created by Sarah Ninsi Abreu de Almeida on 16/03/21.
//

import SwiftUI
import CloudKit
import UserNotifications

@main
struct AmoroAppApp: App {
    @State private var skipLogin = UserDefaults.standard.bool(forKey: "skipLogin")
    @State private var roomNumber = UserDefaults.standard.integer(forKey: "room")
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                if skipLogin != false {
                    //MenuCategoryView(roomNumber: roomNumber)
                    ContentView()
                } else {
                    //CodeLoginView()
                    ContentView()
                }
                
            }
            
        }
        // Request permission from user to send notification
        
        
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
