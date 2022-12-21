//
//  ViewController.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 13.11.2022.
//

import UIKit
import Realm
import RealmSwift

struct KeyDefaults {
    static let keyNameTextField = "nameTextFieldDef"
    static let keyAgeTextField = "ageTextFieldDef"
    static let keyNameChildTextField = "nameChildTextFieldDef"
    static let keyAgeChildTextField = "ageChildTextFieldDef"
}

// MARK: - Constant Constraints

extension CGFloat {
    
    static let headerViewHeightAnchor : CGFloat = -550
    static let myTableViewTrailingAnchor : CGFloat = 50
    static let myTableViewBottomAnchor : CGFloat = -90
}

class MainViewController: UIViewController,UITextFieldDelegate  {
    
    // создаем инициализацию UserDefaults
    let defaults = UserDefaults.standard
    
    // MARK: - Lifecycle
    
    let headerView = HeaderView()
    let footerView = FooterView()
    let myTableView = UITableView(frame: .zero, style: .plain)
    let cellScreen = MyOwnCell()
    
    var items: [CellModel] = []
    
    var isButtonEnabled: Bool {
        items.count >= 4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.delegate = self
        footerView.delegate = self
        setupTableView()
        setupConstraints()
        colorView ()
        
        headerView.nameTextField.text = defaults.string(forKey:"nameTextFieldDef")
        headerView.ageTextField.text = defaults.string(forKey: "ageTextFieldDef")
        cellScreen.nameChildTextField.text = defaults.string(forKey:"nameChildTextFieldDef")
        cellScreen.ageChildTextField.text = defaults.string(forKey: "ageChildTextFieldDef")
        
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
        cell.nameChildTextField.delegate = self
        cell.ageChildTextField.delegate = self
        cell.nameChildTextField.tag = indexPath.row
        cell.ageChildTextField.tag = indexPath.row
        cell.setupContent(model: items[indexPath.row] )
        cell.delegate = self
        
        return cell
    }
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("добавить ребенка таблица")
    
}

extension MainViewController: UITableViewDelegate {
}

// MARK: - Action Delegate

extension MainViewController: MyOwnCellDelegate {
    
    func didTapDelete() {
        
        buttonEnabledDelete ()
        items.remove(at:0)
        let indexPath = IndexPath(item: 0, section: 0)
        myTableView.deleteRows(at: [indexPath], with: .middle)
        myTableView.reloadData()
    }
}

extension MainViewController: HeaderViewDelegate {
    
    func didTapAdd()  {
        footerView.clearButton.isHidden = false
        
        let cellModel = CellModel(index: "", textFieldName: "", textFieldAge: "", deleteButton: "")
        
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
        
        let saveActionButton = UIAlertAction(
            title: "Cохранить",
            style: .destructive
            
        ) { [weak self] _ in
            guard let self = self else { return }
            
            // создание экшена User Defaults
            let nameTextFieldDef = self.headerView.nameTextField.text!
            let ageTextFieldDef = self.headerView.ageTextField.text!
            let nameChildTextFieldDef = self.cellScreen.nameChildTextField.text!
            let ageChildTextFieldDef = self.cellScreen.ageChildTextField.text!
            //             проверка на пустые поля
            if !nameTextFieldDef.isEmpty && !ageTextFieldDef.isEmpty && !nameChildTextFieldDef.isEmpty && !ageChildTextFieldDef.isEmpty {
            }
            
            self.defaults.set(nameTextFieldDef,forKey: "nameTextFieldDef")
            self.defaults.set(ageTextFieldDef,forKey: "ageTextFieldDef")
            self.defaults.set(nameChildTextFieldDef,forKey: "nameChildTextFieldDef")
            self.defaults.set(ageChildTextFieldDef,forKey: "ageChildTextFieldDef")
            
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
        actionSheetController.addAction(saveActionButton)
        actionSheetController.addAction(deleteActionButton)
        self.present(actionSheetController, animated: true,completion: nil)
    }
}

extension MainViewController {
    
    private func buttonEnabledAdd () {
        
        if isButtonEnabled {
            
            headerView.addButton.isEnabled = false
        } else {
            headerView.addButton.isEnabled = true
        }
    }
    
    private func buttonEnabledDelete () {
        
        if isButtonEnabled {
            headerView.addButton.isEnabled = false
        } else {
            headerView.addButton.isEnabled = true
        }
        
    }
    
    private func alertAction() {
        headerView.nameTextField.text = ""
        headerView.ageTextField.text = ""
        footerView.clearButton.isHidden = true
        items.removeAll()
        myTableView.reloadData()
    }
}



