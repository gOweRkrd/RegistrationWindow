//
//  ExtensionViewController.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 15.11.2022.
//

import UIKit

extension MainViewController {
    
    func setupTableView() {
        
        myTableView.backgroundColor = UIColor(red: 237/255, green: 231/255, blue: 229/255, alpha: 1)
        myTableView.rowHeight = 130
        myTableView.register(MyOwnCell.self, forCellReuseIdentifier: "CellID")
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
}
