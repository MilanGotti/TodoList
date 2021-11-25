//
//  UIView+Extension.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import UIKit

extension UIView {
    func dropShadow(color: UIColor = .gray, opacity: Float = 0.4, offSet: CGSize = CGSize(width: 2, height: 2), radius: CGFloat = 4, scale: Bool = true, cornerRadius : CGFloat = 5) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.cornerRadius = cornerRadius
    }
}
