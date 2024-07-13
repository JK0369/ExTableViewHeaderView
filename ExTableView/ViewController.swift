//
//  ViewController.swift
//  ExTableView
//
//  Created by 김종권 on 2024/07/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let tableView = UITableView(frame: .zero, style: .grouped)
    let sections = [
        "Section 1",
        "Section 2"
    ]
    let data = [
        [
            "Item 1",
            "Item 2",
            "Item 3"
        ],
        [
            "Item 4",
            "Item 5",
            "Item 6"
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(
            tableView
        )
        tableView.register(
            HeaderView.self,
            forHeaderFooterViewReuseIdentifier: HeaderView.reuseIdentifier
        )
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "cell"
        )
    }
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        sections.count
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        data[section].count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        )
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: HeaderView.reuseIdentifier
        ) as! HeaderView
        headerView.label.text = sections[section]
        return headerView
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(
            at: indexPath,
            animated: true
        )
    }
}
