//
//  AppControls.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import UIKit

class AppControls: NSObject {

    static let shared = AppControls()
    
    func makeRootViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let rootVC = storyboard.instantiateViewController(withIdentifier: "MainNVC") as? UINavigationController else {
            return
        }
        UIApplication.shared.windows.first?.rootViewController = rootVC
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
}
