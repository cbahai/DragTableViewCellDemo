//
//  ViewController.swift
//  DragTableViewCellDemo
//
//  Created by 冯勇海 on 15/6/24.
//  Copyright © 2015年 Chai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datas: NSMutableArray = []
        for i in 222...289 {
            let data = ListData()
            data.content = String(i)
            data.id = i
            datas.addObject(data)
        }
        
        let tableView = DragTableView(frame: CGRectMake(0, 20, view.frame.width, view.frame.height - 20))
        tableView.datas = datas
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

