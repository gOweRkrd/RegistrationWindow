//
//  ExtensionAction.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 15.11.2022.
//

import UIKit

extension MainViewController {
    
    func action() {
        
        headerView.buttonHandler = {
          [weak self] in

        }
        footerView.buttonFooter = {
            [weak self] in
            
            let actionSheetController = UIAlertController(title: "Please select",
                                                          message: "Option to select",
                                                          preferredStyle: .actionSheet)

            let cancelActionButton = UIAlertAction(title: "Отмена",
                                                   style: .cancel) { _ in

                print("отмена")
            }
            let deleteActionButton = UIAlertAction(title: "Сбросить данные",
                                                   style: .destructive) { [self] _ in

                print("сбросить данные")
            }
            actionSheetController.addAction(cancelActionButton)
            actionSheetController.addAction(deleteActionButton)
            self?.present(actionSheetController, animated: true,completion: nil)
        }
    }
}
