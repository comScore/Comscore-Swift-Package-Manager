//
//  Copyright © 2020 comScore. All rights reserved.
//

import UIKit
import ComScore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if(!UserDefaults.standard.bool(forKey:"CSTrackingDisablePreferenceKey")) {
            // Initialize ComScore library
            let publisherConfiguration = SCORPublisherConfiguration(builderBlock: { builder in
                builder?.publisherId = "1234567"
            })

            SCORAnalytics.configuration().addClient(with:publisherConfiguration)
            SCORAnalytics.configuration().enableImplementationValidationMode()
            SCORAnalytics.start()
        }

        return true
    }

    // MARK: - UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate.
    }

}

