//
//  TodoItemCell.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import UIKit

class TodoItemCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet weak var viewBackGround: UIView!
    @IBOutlet weak var viewStatus: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    
    //MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewBackGround.dropShadow(cornerRadius: 3.5)
        self.viewStatus.layer.cornerRadius = self.viewStatus.frame.height / 2
        self.viewStatus.clipsToBounds = true
        self.labelTitle.font = .systemFont(ofSize: 16, weight: .semibold)
    }

    //MARK: Setup UI
    func setupList(_ item: TodoDetails, _ index: Int, _ selectedIndex: Int, _ selectedColor: Int) {
        self.labelTitle.text = (item.title ?? "").capitalized
        self.viewStatus.backgroundColor = item.completed ?? false ? UIColor.systemGreen : UIColor.red
        
        if deviceType == .pad && index == selectedIndex {
            self.viewBackGround.backgroundColor = colorArray[selectedColor].withAlphaComponent(0.2)
        } else {
            self.viewBackGround.backgroundColor = .white
        }
    }
    
}
