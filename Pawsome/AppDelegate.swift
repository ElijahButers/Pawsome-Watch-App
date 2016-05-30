/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    registerUserNotificationSettings()
    scheduleLocalNotification()
    return true
  }
  
  // MARK: - Notifications
  
  func registerUserNotificationSettings() {
    let pawsomeCategory = UIMutableUserNotificationCategory()
    pawsomeCategory.identifier = "Pawsome"
    
    let viewCatsAction = UIMutableUserNotificationAction()
    viewCatsAction.identifier = "viewCatsAction"
    viewCatsAction.title = "More Cats!  "
    viewCatsAction.activationMode = .Foreground
    pawsomeCategory.setActions([viewCatsAction], forContext: .Default)
    
    let settings = UIUserNotificationSettings(forTypes: [.Alert], categories: Set([pawsomeCategory]))
    UIApplication.sharedApplication().registerUserNotificationSettings(settings)
  }
  
  func scheduleLocalNotification() {
    let application = UIApplication.sharedApplication()
    if let types = application.currentUserNotificationSettings()?.types
      where types.contains(.Alert) {

        application.cancelAllLocalNotifications()
        
        let notification = UILocalNotification()
        notification.fireDate = NSDate(timeIntervalSinceNow: NSTimeInterval(5))
        notification.repeatInterval = .Hour
        notification.alertBody = "Pawsome time!"
        notification.category = "Pawsome"
        let userInfo: [NSObject : AnyObject] = [
          "notification_id" : "PawsomeNotification"
        ]
        notification.userInfo = userInfo
        
        application.scheduleLocalNotification(notification)
      
    }
  }
}

