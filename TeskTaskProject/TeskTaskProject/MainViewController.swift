//
//  ViewController.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 13.11.2022.
//

import UIKit

//    1. как сделать ,так чтобы при сборке не было видно ячейки  ?
//    2. как сделать ,чтобы при сбросе данных ,данные очищались и в ячейке таблицы ?

// MARK: - Constant Constraints

    extension CGFloat {
        
    static let headerViewHeightAnchor : CGFloat = -550
    
    static let myTableViewTrailingAnchor : CGFloat = 50
    static let myTableViewBottomAnchor : CGFloat = -90
}

class MainViewController: UIViewController {
    
    var isButtonEnabled: Bool {
        items.count >= 4
    }
   
    // MARK: - Lifecycle
    
            let headerView = HeaderView()
            let footerView = FooterView()
            let myTableView = UITableView(frame: .zero, style: .plain)
            let cellView = MyOwnCell ()
  
    var items = [CellModel(textFieldName: "", textFieldAge: "", deleteButton: "")]
//    var items = [Int]()

    
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
// при любом нажатии кнопки(удалить или добавить) очищает  ячейки
//        cell.ageChildTextField.text = ""
//        cell.nameChildTextField.text = ""
    
        cell.setupContent(model: items[indexPath.row] )
       
        cell.delegate = self
        headerView.delegate = self
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
        
// метод поставновки ограничения на добавления в массив
        buttonEnabledDelete ()
        items.removeFirst()
        myTableView.reloadData()
    }
}

extension MainViewController: HeaderViewDelegate {
    
    func didTapAdd()  {
        footerView.clearButton.isHidden = false

         let cellModel = CellModel(textFieldName: "", textFieldAge: "", deleteButton: "")
        
// метод поставновки ограничения на добавления в массив
        buttonEnabledAdd ()
    
        items.append(cellModel)
        myTableView.reloadData()
    }
}

extension MainViewController: FooterCellDelegate {
    
    func didTapCler() {
        
        let actionSheetController = UIAlertController(
            title: "Please select",
            message: "Option to select",
            preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(
            title: "Отмена",
            style: .cancel
        ) { _ in
            
            print("отмена")
        }
        
        let deleteActionButton = UIAlertAction(
            title: "Сбросить данные",
            style: .destructive
        ) { [weak self] _ in
            guard let self = self else { return }
            
            self.alertAction()
            self.buttonEnabledDelete()
            self.buttonEnabledDelete()
        }
        
        actionSheetController.addAction(cancelActionButton)
        actionSheetController.addAction(deleteActionButton)
        self.present(actionSheetController, animated: true,completion: nil)
    }
}

extension MainViewController {
    
        private func buttonEnabledAdd () {
            
            if isButtonEnabled {
                
                headerView.addButton.isEnabled = false
                headerView.addButton.setTitleColor(UIColor.red, for: .normal)
            } else {
                headerView.addButton.isEnabled = true
            }
        }
        
        private func buttonEnabledDelete () {
            
            if isButtonEnabled {
                headerView.addButton.isEnabled = false
                headerView.addButton.setTitleColor(UIColor.blue, for: .normal)
            } else {
                headerView.addButton.isEnabled = true
            }
            
            
        }
        
        private func alertAction() {
            headerView.nameTextField.text = ""
            headerView.ageTextField.text = ""
//   не работает
//          cellView.ageChildTextField.text = ""
//          cellView.nameChildTextField.text = ""
            
            footerView.clearButton.isHidden = true
           
            items.removeAll()
            myTableView.reloadData()
        }
    }
    


