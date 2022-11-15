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
    
  
        
    var items = [CellModel(textFieldName: "", textFieldAge: "", deleteButton: ""),
                 CellModel(textFieldName: "", textFieldAge: "", deleteButton: ""),
                 CellModel(textFieldName: "", textFieldAge: "", deleteButton: ""),
                 CellModel(textFieldName: "", textFieldAge: "", deleteButton: ""),
                 CellModel(textFieldName: "", textFieldAge: "", deleteButton: ""),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupConstraints()
        colorView ()
        action()
        
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
        // вызываем делегат для головной вью
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
        items.remove(at: 0)
        myTableView.reloadData()
    }
}

extension MainViewController: HeaderViewDelegate {
    
    func didTapAdd() {
        let cellModel = CellModel(textFieldName: "", textFieldAge: "", deleteButton: "")
        items.append(cellModel)
        myTableView.reloadData()
    }
}

extension MainViewController: FooterCellDelegate {
    
    func didTapCler() {
        items.remove(at:0)
        myTableView.reloadData()
    }
}



