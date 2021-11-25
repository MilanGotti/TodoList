//
//  TodoItemHeaderView.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import UIKit

class TodoItemHeaderView: UITableViewHeaderFooterView {

    //MARK: Outlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewCompeteStatus: UIView!
    @IBOutlet weak var labelComplete: UILabel!
    @IBOutlet weak var viewIncomplete: UIView!
    @IBOutlet weak var labelIncomplete: UILabel!
    
    //MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.labelTitle.textColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        
        self.labelComplete.text = TaskStatus.complete.rawValue
        self.viewCompeteStatus.backgroundColor = .systemGreen
        self.viewCompeteStatus.layer.cornerRadius = self.viewCompeteStatus.frame.height / 2
        self.viewCompeteStatus.clipsToBounds = true
        
        self.labelIncomplete.text = TaskStatus.incomplete.rawValue
        self.viewIncomplete.backgroundColor = .red
        self.viewIncomplete.layer.cornerRadius = self.viewIncomplete.frame.height / 2
        self.viewIncomplete.clipsToBounds = true
        
    }
    
}
