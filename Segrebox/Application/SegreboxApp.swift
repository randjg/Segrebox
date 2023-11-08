//
//  SegreboxApp.swift
//  Segrebox
//
//  Created by Randy Julian on 21/10/23.
//

import SwiftUI
import Firebase
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct SegreboxApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var viewModel = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup {
<<<<<<< HEAD:Segrebox/SegreboxApp.swift
            RootView()
=======
            LoginView()
                .environmentObject(viewModel)
>>>>>>> development:Segrebox/Application/SegreboxApp.swift
        }
    }
}