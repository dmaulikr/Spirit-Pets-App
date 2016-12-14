//
//  AppDelegate.swift
//  SpiritPets
//
//  Created by Edvaldo Junior on 28/11/16.
//  Copyright © 2016 Edvaldo Junior. All rights reserved.
//

import UIKit

protocol SaveStatusDelegate {
    
    func save()
    
    func load()
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var multipeerManager: MultipeerManager!
    var gameArray = [0,0,0,0,0,0,0,0,0]
    var gameTurn: Bool?
    var gameUser: Int?
    
    var saveDelegate: SaveStatusDelegate? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        if UserDefaults.standard.bool(forKey: "runBefore"){
            let mainStoryBoard = UIStoryboard.init(name: "Main", bundle: nil)
            self.window?.rootViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MainScreenViewController")
        }
        multipeerManager = MultipeerManager()
        return true
    }
    
    func receiveMessage(dic: NSDictionary) {
        self.gameArray = dic["gameArray"] as! [Int]
        self.gameTurn = false
        print(self.gameArray)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        saveDelegate?.save()
    }
}
