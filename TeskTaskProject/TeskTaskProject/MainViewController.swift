//
//  ViewController.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 13.11.2022.
//

import UIKit

// MARK: - Constant Constraints

    extension CGFloat {
        
    static let headerViewHeightAnchor : CGFloat = -550
    
    static let myTableViewTrailingAnchor : CGFloat = 50
    static let myTableViewBottomAnchor : CGFloat = -90
}

class MainViewController: UIViewController {
   
    

    // MARK: - Lifecycle
    
            let headerView = HeaderView()
            let footerView = FooterView()
            let myTableView = UITableView(frame: .zero, style: .plain)
  
    var items:[CellModel] = [CellModel(textFieldName: "", textFieldAge: "", deleteButton: "")]
          
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupConstraints()
        colorView ()
        
        }
        
    }

// MARK: - TableViewDataSource,TableViewDelegate

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? MyOwnCell  else {
            fatalError("Creating cell from HotelsListViewController failed")

        }
       
        cell.setupContent(model: items[indexPath.row])
        // вызываем делегат для ячейки
        cell.delegate = self
        // вызываем делегат для верхнего вью
        headerView.delegate = self
        // вызываем делегат для нижнего вью
        footerView.delegate = self

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            print("добавить ребенка таблица")
        
        }
  
    }

extension MainViewController: UITableViewDelegate {
}

// MARK: - Action Delegate

extension MainViewController: MyOwnCellDelegate {
  
    func didTapDelete() {
        items.remove(at: 0)
        myTableView.reloadData()
    }
}

extension MainViewController: HeaderViewDelegate {
    
    func didTapAdd() {
        footerView.clearButton.isHidden = false
//        cellModel.nameChildTextField.isHidden = true
//        cellModel.ageChildTextField.isHidden = true
//        cellModel.deleteButton.isHidden = true
         let cellModel = CellModel(textFieldName: "", textFieldAge: "", deleteButton: "")
        items.append(cellModel)
        myTableView.reloadData()
    }
}

extension MainViewController: FooterCellDelegate {
    
    func didTapCler() {
        
        let actionSheetController = UIAlertController(title: "Please select",
                                                      message: "Option to select",
                                                      preferredStyle: .actionSheet)

        let cancelActionButton = UIAlertAction(title: "Отмена",
                                               style: .cancel) { _ in

            print("отмена")
        }
        let deleteActionButton = UIAlertAction(title: "Сбросить данные",
                                               style: .destructive) { [self] _ in
            
            
            self.headerView.nameTextField.text = ""
            self.headerView.ageTextField.text = ""
            
            footerView.clearButton.isHidden = true
            items.removeAll()
            myTableView.reloadData()

            }

        actionSheetController.addAction(cancelActionButton)
        actionSheetController.addAction(deleteActionButton)
    self.present(actionSheetController, animated: true,completion: nil)

    }
}



