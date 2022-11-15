//
//  ViewController.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 13.11.2022.
//

import UIKit

// MARK: - Constant Constraints
private extension CGFloat {
        
    static let headerViewHeightAnchor : CGFloat = -550
    
    static let myTableViewTrailingAnchor : CGFloat = 50
    static let myTableViewBottomAnchor : CGFloat = -90
}

class MainViewController: UIViewController {

    // MARK: - Lifecycle
    
    private let headerView = HeaderView()
    private let footerView = FooterView()
    private let myTableView = UITableView(frame: .zero, style: .plain)
    
    
    var items = ["1","2","3","4","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
        view.backgroundColor = UIColor(red: 237/255, green: 231/255, blue: 229/255, alpha: 1)
        headerView.backgroundColor = UIColor(red: 237/255, green: 231/255, blue: 229/255, alpha: 1)
        footerView.backgroundColor = UIColor(red: 237/255, green: 231/255, blue: 229/255, alpha: 1)
        // делаем связь экранов
        headerView.buttonHandler = {
            [weak self] in
//           nameChildTextField.isHidden = false
//           ageChildTextField.isHidden = false
//           deleteButton.isHidden = false
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
//                    nameChildTextField.isHidden = false
//                        ageChildTextField.isHidden = false
//                self?.footerView.clearButton.isHidden = false
                



                print("сбросить данные")
            }
            actionSheetController.addAction(cancelActionButton)
            actionSheetController.addAction(deleteActionButton)
            self?.present(actionSheetController, animated: true,completion: nil)
        }

    }
    
    // MARK: - Setup TableView
    
    private func setupTableView() {
        
        myTableView.backgroundColor = UIColor(red: 237/255, green: 231/255, blue: 229/255, alpha: 1)
        myTableView.rowHeight = 130
        myTableView.register(MyOwnCell.self, forCellReuseIdentifier: "CellID")
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    // MARK: - Setup Constrains
    
        private func setupConstraints() {
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

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            print("добавить ребенка таблица")
        
        }
  
    }

extension MainViewController: UITableViewDelegate {
}




