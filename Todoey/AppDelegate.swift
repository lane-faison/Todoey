//
//  AppDelegate.swift
//  Todoey
//
//  Created by Lane Faison on 6/21/19.
//  Copyright © 2019 Lane Faison. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        do {
            let _ = try Realm()
        } catch {
            print("Error initializing new Realm: \(error)")
        }
        
        return true
    }
}

