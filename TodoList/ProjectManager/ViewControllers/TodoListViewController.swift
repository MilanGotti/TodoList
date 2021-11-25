//
//  TodoListViewController.swift
//  TodoList
//
//  Created by Milan Goti on 25/11/21.
//

import UIKit

class TodoListViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK:- Declarations
    let refreshControl = UIRefreshControl()
    var viewModel = TodoListViewModel()
    var randomColorIndex = 0
    var selectedIndex = 0
    
    //MARK:- View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.getTodoList()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.randomColorIndex = Int.random(in: 0...9)
    }
    
    
    //MARK:- API Calling
    func getTodoList(_ fromPullRequsest: Bool = false) {
        if !fromPullRequsest { sLoaderView.startAnimating() }
        self.viewModel.getToloList { (result, error) in
            if !fromPullRequsest { sLoaderView.stopAnimating() }
            self.refreshControl.endRefreshing()
            UIView.animate(withDuration: 0.5, animations: {
                self.tableView.contentOffset = CGPoint.zero
            })
            if result {
                self.tableView.reloadData()
                self.setupSplitView()
            } else {
                self.showAlertMessage(title: SuccessStatus.error.rawValue, message: error)
                
            }
            
        }
    }
    
   
    //MARK:- Others Functions
    
    func setupTableView() {
        
        // register table XIbs
        let headerNib = UINib.init(nibName: CellIdentifiers.TodoItemHeaderView.rawValue, bundle: Bundle.main)
        self.tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: CellIdentifiers.TodoItemHeaderView.rawValue)
        self.tableView.register(UINib(nibName: CellIdentifiers.TodoItemCell.rawValue, bundle: nil), forCellReuseIdentifier: CellIdentifiers.TodoItemCell.rawValue)
        
        // tableView delegate and dataSource
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //Add Pull to refresh Control
        
        self.refreshControl.tintColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        self.refreshControl.addTarget(self, action: #selector(refreshControlMethod), for: .valueChanged)
        self.tableView.refreshControl = self.refreshControl
        
    }
    
    
    @objc func refreshControlMethod(_ refreshControl: UIRefreshControl) {
        self.getTodoList(true)
    }
    
    //For iPad only
    func setupSplitView() {
        if deviceType == .pad {
            let destination = self.storyboard?.instantiateViewController(identifier: "TodoDetailsViewController") as! TodoDetailsViewController
            destination.item = self.viewModel.todoListArray[0]
            destination.randomColorIndex = self.randomColorIndex
            splitViewController?.showDetailViewController(destination, sender: nil)
        }
    }
    
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.todoListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.TodoItemCell.rawValue, for: indexPath) as! TodoItemCell
        cell.setupList(self.viewModel.todoListArray[indexPath.row], indexPath.row, self.selectedIndex, self.randomColorIndex)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //Select Todo Item
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if deviceType == .pad {
            
            self.randomColorIndex = Int.random(in: 0...9)
            self.selectedIndex = indexPath.row
            self.tableView.reloadData()
            
            let destination = self.storyboard?.instantiateViewController(identifier: ControllerIdentifiers.TodoDetailsViewController.rawValue) as! TodoDetailsViewController
            destination.item = self.viewModel.todoListArray[indexPath.row]
            destination.randomColorIndex = self.randomColorIndex
            splitViewController?.showDetailViewController(destination, sender: nil)
            
        } else {
            
            let destination = self.storyboard?.instantiateViewController(identifier: "TodoDetailsViewController") as! TodoDetailsViewController
            destination.item = self.viewModel.todoListArray[indexPath.row]
            destination.randomColorIndex = self.randomColorIndex
            self.navigationController?.pushViewController(destination, animated: true)
        }
        
    }
    
    
    //Delete Cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.viewModel.todoListArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            if deviceType == .pad {
                self.selectedIndex = 0
                self.tableView.reloadData()
                self.setupSplitView()
            }
        }
    }
    
    //Setup Header Cell
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellIdentifiers.TodoItemHeaderView.rawValue) as! TodoItemHeaderView
        headerView.backgroundView = UIView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
}

