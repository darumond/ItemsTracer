//
//  AppDelegate.swift
//  ItemsTracer
//
//  Created by Luc Nguyen on 31/01/2024.
//
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage
import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        //Uncomment this line if you want to use local emulator
        setupFirebaselocalEmulator()
        return true;
    }
    
    func setupFirebaselocalEmulator(){
        var host = "127.0.0.1"
        #if !targetEnvironment(simulator)
        host = "192.168.1.60"
        #endif
        
        let settings = Firestore.firestore().settings
        settings.host = "\(host):8080"
        settings.isSSLEnabled = false
        Firestore.firestore().settings = settings
        
        Storage.storage().useEmulator(withHost: host, port: 9199)
    }
}
