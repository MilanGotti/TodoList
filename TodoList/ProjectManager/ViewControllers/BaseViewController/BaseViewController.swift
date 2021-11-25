//
//  BaseViewController.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import UIKit

class BaseViewController: UIViewController {

    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sLoaderView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        sKeyWindow?.addSubview(sLoaderView)
        
        if deviceType == .phone {
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        }
    }
    
    
    
    //MARK: Button Action
    @objc func buttonBackClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
 
extension BaseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
        }
}
