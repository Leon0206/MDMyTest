//
//  SettingVC.swift
//  Home
//
//  Created by lizitao on 2022/11/30.
//

import UIKit

class SettingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    
    let cellReuseIdentifier = "cell"
    
    lazy var items: [String] = {
           var items = [String]()
           for i in 1...10 {
               items.append("Item \(i)")
           }
           return items
    }()
    public override func viewDidLoad() {
        super.viewDidLoad()
        let navBarHeight = navigationController?.navigationBar.frame.height ?? 0
        
        tableView = UITableView(frame: CGRect(x: 0, y: navBarHeight, width: view.bounds.width, height: view.bounds.height - navBarHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        self.title = "设置"
        
    }
    
    // MARK: - TableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.backgroundColor = .lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    // MARK: - TableView Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print("You tapped cell number \(indexPath.row).")
    }
}
