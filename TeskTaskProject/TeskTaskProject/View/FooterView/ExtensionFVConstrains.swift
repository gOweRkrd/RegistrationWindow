//
//  ExtensionFVConstrains.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 15.11.2022.
//

import UIKit

extension FooterView {
    
     func setupConstraintsFooter() {

        clearButton.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                clearButton.topAnchor.constraint(equalTo: self.topAnchor, constant: .clearButtonTopAncor),
                clearButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .clearButtonLeadingAnchor),
                clearButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .clearButtonTrailingAnchor),
                clearButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                clearButton.heightAnchor.constraint(equalToConstant: .clearButtonHeightAnchor)
            ])
    }
    
    func setupFooter() {
       addSubview(clearButton)
       setupConstraintsFooter()
   }
}
