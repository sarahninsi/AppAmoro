//
//  AmoroAppApp.swift
//  AmoroApp WatchKit Extension
//
//  Created by Sarah Ninsi Abreu de Almeida on 16/03/21.
//

import SwiftUI
import CloudKit

@main
struct AmoroAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                CodeLoginView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
