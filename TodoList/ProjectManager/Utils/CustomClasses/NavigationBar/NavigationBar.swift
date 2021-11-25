//
//  NavigationBar.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import UIKit

class NavigationBar: UIView {

    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnRight: UIButton!
    
    
    var title: String = "" {
        didSet {
            self.setupUI()
        }
    }
    
    var leftImage: UIImage = #imageLiteral(resourceName: "ic_ArrowLeft") {
        didSet {
            self.setupUI()
        }
    }
    
    var rightImage: UIImage = #imageLiteral(resourceName: "ic_Add_Black") {
        didSet {
            self.setupUI()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        
        let view =  UINib(nibName: "NavigationBar", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = self.bounds
        
        self.addSubview(view)
        
        self.btnRight.isHidden = true
        self.lblTitle.font = .systemFont(ofSize: 18, weight: .bold)
        
        let image = self.leftImage.withRenderingMode(.alwaysTemplate)
        self.btnLeft.setImage(image, for: .normal)
        self.btnLeft.tintColor = .black
        
        self.btnRight.tintColor = .black
        self.lblTitle.textColor = .black
        
    }
    
    func setupUI() {
        self.lblTitle.text = self.title
        
        let leftTmpImage = self.leftImage.withRenderingMode(.alwaysTemplate)
        self.btnLeft.setImage(leftTmpImage, for: .normal)
        
        let rightTmpImage = self.rightImage.withRenderingMode(.alwaysTemplate)
        self.btnRight.setImage(rightTmpImage, for: .normal)
    }
    
    
}
