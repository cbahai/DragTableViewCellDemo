//
//  DragTableView.swift
//  DragTableViewCellDemo
//
//  Created by 冯勇海 on 15/6/24.
//  Copyright © 2015年 Chai. All rights reserved.
//

import UIKit

class DragTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    var datas: NSMutableArray = []
    let cellReuseIdentifier = "CELL_ID"
    
    init(frame: CGRect) {
        super.init(frame: frame, style: .Plain)
        dataSource = self
        delegate = self
        editing = true
        self.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
        if let data = datas[indexPath.row] as? ListData {
            cell.textLabel?.text = data.content
        }
        return cell
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let data = datas.objectAtIndex(sourceIndexPath.row)
        datas.removeObjectAtIndex(sourceIndexPath.row)
        datas.insertObject(data, atIndex: destinationIndexPath.row)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .None
    }
    
    func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
}
