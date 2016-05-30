//
//  NotificationController.swift
//  Pawsome
//
//  Created by User on 5/30/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {
  
  //Outlets
  @IBOutlet var label: WKInterfaceLabel!
  @IBOutlet var image: WKInterfaceImage!

    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
  
  override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: (WKUserNotificationInterfaceType) -> Void) {
    
    updateDisplayWithNotificationUserInfo(remoteNotification)
    
    completionHandler(.Custom)
  }
  
  func randomInt(min: Int, max: Int) -> Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
  }
  
  func updateDisplayWithNotificationUserInfo(userInfo: [NSObject : AnyObject]) {
    let catImageName = String(format: "cat%02d", arguments: [randomInt(1, max: 20)])
    image.setImageNamed(catImageName)
    if let aps = userInfo["aps"] as? NSDictionary,
      let alert = aps["alert"] as? NSDictionary,
      let body = alert["body"] as? String {
        label.setText(body)
    }
  }

    /*
    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a local notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.Custom)
    }
    */
    
    /*
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a remote notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.Custom)
    }
    */
}
