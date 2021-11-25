//
//  GlobalSplitViewController.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import UIKit

class GlobalSplitViewController: UISplitViewController {

    //MARK:- View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if deviceType != .pad {
            AppControls.shared.makeRootViewController()
        }
        self.preferredSplitBehavior = UISplitViewController.SplitBehavior.displace
        self.preferredDisplayMode = UISplitViewController.DisplayMode.oneBesideSecondary
    }
    
}
