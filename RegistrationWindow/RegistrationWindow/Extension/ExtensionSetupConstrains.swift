//
//  ExtensionalConstrains.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 15.11.2022.
//

import UIKit

extension MainViewController {
    
    func setupConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(headerView)
        view.addSubview(myTableView)
        view.addSubview(footerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        footerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.heightAnchor.constraint(equalTo: view.heightAnchor,constant:.headerViewHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant:.myTableViewTrailingAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:.myTableViewBottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalTo: myTableView.bottomAnchor,constant:0),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
        
    }
}
