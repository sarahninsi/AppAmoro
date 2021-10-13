//
//  NotificationController.swift
//  AmoroApp WatchKit Extension
//
//  Created by Sarah Ninsi Abreu de Almeida on 16/03/21.
//

import WatchKit
import CloudKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView>, ObservableObject {

    override var body: NotificationView {
        return NotificationView()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        
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
        
        let subscription = CKQuerySubscription(recordType: "Message", predicate: NSPredicate(format: "TRUEPREDICATE"), options: .firesOnRecordCreation)
        
        let info = CKSubscription.NotificationInfo()
        
        info.titleLocalizationKey = "%1$@"
        info.titleLocalizationArgs = ["image"]
        
        info.alertLocalizationKey = "%1$@"
        info.alertLocalizationArgs = ["text"]
        info.soundName = "default"
        info.shouldBadge = true
        
        subscription.notificationInfo = info
        
        CKContainer(identifier: "iCloud.com.viniciuspinheiro.Amoro").publicCloudDatabase.save(subscription, completionHandler: { subscription, error in
            if error == nil {
                // Subscription saved successfully iCloud.com.viniciuspinheiro.Amoro
            } else {
                print(error)
            }
        })
         
    
    }
    
   //egisterForRem
    
    
    
}
