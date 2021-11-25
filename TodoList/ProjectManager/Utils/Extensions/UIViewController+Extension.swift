//
//  UIViewController+Extension.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import UIKit

extension UIViewController {
    
    func showAlertMessage(title:String, message:String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in })
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}
