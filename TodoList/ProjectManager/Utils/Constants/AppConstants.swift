//
//  AppConstants.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import UIKit


//MARK:- Screen size
let SCREEN_BOUND = UIScreen.main.bounds
let SCREEN_Width = SCREEN_BOUND.width
let SCREEN_Height = SCREEN_BOUND.height


//MARK:- Key Window
let sKeyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })


//MARK:- NVActivity Indicator
let iPhonePadding = SCREEN_Width / 1.82
let iPadPadding = SCREEN_Width / 1.94

let sLoaderView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: SCREEN_Width, height: SCREEN_Height), color: #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1), padding: deviceType == .pad ? iPadPadding : iPhonePadding)

//MARK: Color Array
let colorArray = [#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1), #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1), #colorLiteral(red: 0.1829660943, green: 0.7549374656, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1), #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1), #colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1), #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)]


//Check iPad or iPhone
let deviceType = UIScreen.main.traitCollection.userInterfaceIdiom
