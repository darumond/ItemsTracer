//
//  ItemsTracerApp.swift
//  ItemsTracer
//
//  Created by Luc Nguyen on 31/01/2024.
//

import SwiftUI

@main
struct ItemsTracerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
           WindowGroup {
               NavigationStack {
                   InventoryListView()
               }
           }
       }
}
