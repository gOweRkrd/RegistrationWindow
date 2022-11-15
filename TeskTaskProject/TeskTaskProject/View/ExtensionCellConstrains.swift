//
//  ExtensionCellConstrains.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 15.11.2022.
//

import UIKit

extension MyOwnCell {

private func setupConstraintsCell() {
    
    nameChildTextField.translatesAutoresizingMaskIntoConstraints = false
    ageChildTextField.translatesAutoresizingMaskIntoConstraints = false
    deleteButton.translatesAutoresizingMaskIntoConstraints = false
    
    
    NSLayoutConstraint.activate([
        nameChildTextField.topAnchor.constraint(equalTo: contentView.topAnchor,constant:.nameChildTextFieldTopAnchor),
        nameChildTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant:.nameChildTextFieldLeadingAnchor),
        nameChildTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant:.nameChildTextFieldTrailingAnchor),
        nameChildTextField.heightAnchor.constraint(equalTo: contentView.heightAnchor,constant:.nameChildTextFieldHeightAnchor),
    ])
    
    NSLayoutConstraint.activate([
        ageChildTextField.topAnchor.constraint(equalTo: contentView.topAnchor,constant:.ageChildTextFieldTopAnchor),
        ageChildTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant:.ageChildTextFieldLeadingAnchor),
        ageChildTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant:.ageChildTextFieldTrailingAnchor),
        ageChildTextField.heightAnchor.constraint(equalTo: contentView.heightAnchor,constant:.ageChildTextFieldHeightAnchor),
    ])
    
    NSLayoutConstraint.activate([
        deleteButton.topAnchor.constraint(equalTo:contentView.topAnchor,constant:.deleteButtonTopAnchor),
        deleteButton.leadingAnchor.constraint(equalTo:contentView.leadingAnchor,constant:.deleteButtonLeadingAnchor),
        deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        deleteButton.widthAnchor.constraint(equalTo: contentView.widthAnchor,constant:.deleteButtonWidthAnchor),
    ])
    
}

func setupCell() {
    contentView.addSubview(deleteButton)
    contentView.addSubview(nameChildTextField)
    contentView.addSubview(ageChildTextField)
}
    
func configureView() {
    setupCell()
    setupConstraintsCell()
    
}
}
