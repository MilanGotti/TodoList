//
//  TodoDetailsViewController.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import UIKit

class TodoDetailsViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var navigationBar: NavigationBar!
    
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var viewUserID: UIView!
    @IBOutlet weak var labelUserId: UILabel!
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    
    //MARK:- Declarations
    var viewModel = TodoListViewModel()
    var item: TodoDetails?
    var randomColorIndex = 0
    
    
    //MARK:- View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        if deviceType == .pad {
            self.navigationBar.btnLeft.isHidden = true
            self.navigationController?.navigationBar.isHidden = true
        }
        self.setupUI()
        
    }
    
    
    //MARK:- Others Functions
    func setupUI() {
        self.navigationBar.title = "Details"
        self.navigationBar.btnLeft.addTarget(self, action: #selector(buttonBackClick(_:)), for: .touchUpInside)
        if item != nil {
            self.viewCard.isHidden = false
            self.viewCard.backgroundColor = colorArray[randomColorIndex].withAlphaComponent(0.2)
            self.viewCard.dropShadow()
            self.viewUserID.layer.cornerRadius = self.viewUserID.frame.height / 2
            self.viewUserID.clipsToBounds = true
            self.viewUserID.backgroundColor = colorArray[randomColorIndex]
            self.labelUserId.text = String(self.item?.userID ?? 0)
            self.labelId.text = String(self.item?.id ?? 0)
            self.labelTitle.text = self.item?.title ?? ""
            self.labelStatus.text = self.item?.completed ?? false ? TaskStatus.complete.rawValue : TaskStatus.incomplete.rawValue
        } else {
            self.viewCard.isHidden = true
        }
    }
    
  
}
