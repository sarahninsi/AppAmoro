//
//  ContentView.swift
//  AmoroApp WatchKit Extension
//
//  Created by Vinícius Pinheiro on 20/07/1400 AP.
//

import SwiftUI
import WatchKit
import CloudKit
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack
        {
            Button("Request permission")
            {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (success, error) in
                    if success{
                        print("All set")
                        DispatchQueue.main.async(execute: {
                            WKExtension.shared().registerForRemoteNotifications()
                        })
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
                 
            }
            Button("Schedule Notification")
            {
                let content = UNMutableNotificationContent()
                content.title = "Você recebeu um amoro!"
                content.sound = .default
                content.categoryIdentifier = "myCategory"
                let category = UNNotificationCategory(identifier: "myCategory", actions: [], intentIdentifiers: [], options: [])
                UNUserNotificationCenter.current().setNotificationCategories([category])
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: "milk", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request) { (error) in
                    if let error = error{
                        print(error.localizedDescription)
                    }else{
                        print("scheduled successfully")
                    }
                }
            }
        }
    }
}
