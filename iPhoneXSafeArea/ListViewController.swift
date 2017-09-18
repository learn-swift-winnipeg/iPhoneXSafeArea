//
//  ViewController.swift
//  iPhoneXSafeArea
//
//  Created by Justin Stanley on 2017-09-17.
//  Copyright © 2017 Justin Stanley. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    fileprivate let tableData = TableData()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    //MARK: Setup
    private func setupViews() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: CustomTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CustomTableViewCell.nibName)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        tableView.tableFooterView = UIView()
        tableView.separatorColor = UIColor.red.withAlphaComponent(0.75)
    }
}

//MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetails", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}

//MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.titles.count
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let view = view as? UITableViewHeaderFooterView else {
            fatalError("Header view wasn't a UITableViewHeaderFooterView.")
        }
        view.contentView.backgroundColor = UIColor.red.withAlphaComponent(0.75)
        view.textLabel?.textColor = .white
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "iPhone X"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.nibName, for: indexPath) as? CustomTableViewCell else {
            fatalError("Could not dequeue a CustomTableViewCell.")
        }
        
        cell.update(text: tableData.titles[indexPath.row], image: tableData.icons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return [UITableViewRowAction(style: UITableViewRowActionStyle.default,
                                     title: "Tap Me",
                                     handler: { action in
                                        print("Tapped")
        })]
    }
}
