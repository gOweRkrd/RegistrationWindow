//
//  HeadeView.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 13.11.2022.
//

protocol HeaderViewDelegate: AnyObject {
    func didTapAdd()
}

import UIKit

// MARK: - Constant Constraints

    extension CGFloat {
    
    static let welcomeTitleTopAncor: CGFloat = 56
    static let welcomeTitleHeightAnchor: CGFloat = 80.0
    
    static let nameTextFieldTopAncor: CGFloat = 70
    static let nameTextFieldLeadingAnchor: CGFloat = 15
    static let nameTextFieldTrailingAnchor: CGFloat = -15
    static let nameTextFieldHeightAnchor : CGFloat = 50
    
    static let ageTextFieldTopAncor: CGFloat = 60
    static let ageTextFieldLeadingAnchor: CGFloat = 15
    static let ageTextFieldTrailingAnchor: CGFloat = -15
    static let ageTextFieldHeightAnchor : CGFloat = 50
    
    static let childLabelTopAncor: CGFloat = 70
    static let childLabelHeightAnchor: CGFloat = 400
    static let childleadingAnchor: CGFloat = 15.0
    
    static let addButtonTopAncor: CGFloat = 60
    static let addButtonTrailingAnchor: CGFloat = -15
    static let addButtonHeightAnchor : CGFloat = 50
    
}


class HeaderView : UIView {
    
    weak var delegate: HeaderViewDelegate?
    
    var buttonHandler: (() -> Void)?
    
    // MARK: - Costomize
      
     lazy var welcomeTitle : UILabel = {
        let welcomeTitle = UILabel()
        welcomeTitle.text = "Персональные данные"
        welcomeTitle.font = UIFont.systemFont(ofSize: 30)
        welcomeTitle.font = UIFont.boldSystemFont(ofSize: 30.0)
        welcomeTitle.font = UIFont.italicSystemFont(ofSize: 30.0)
        welcomeTitle.textAlignment = .center
        welcomeTitle.textColor = .black
        return welcomeTitle
    } ()
    
    
      lazy var nameTextField : UITextField = {
        let nameTextField = UITextField ()
        nameTextField.backgroundColor = .lightText
        nameTextField.placeholder = "Имя"
        nameTextField.layer.masksToBounds = true
        return nameTextField
    }()
    
      lazy var ageTextField : UITextField = {
        let ageTextField = UITextField ()
        ageTextField.backgroundColor = .lightText
        ageTextField.placeholder = "Возраст"
        ageTextField.layer.masksToBounds = true
        return ageTextField
    }()
    
      lazy var childLabel : UILabel = {
        let childLabel = UILabel()
        childLabel.text = "Дети(макс.5)"
        childLabel.font = UIFont.systemFont(ofSize: 30)
        childLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        childLabel.font = UIFont.italicSystemFont(ofSize: 21.0)
        childLabel.textAlignment = .left
        childLabel.textColor = .black
        return childLabel
    } ()
    
      lazy var addButton : UIButton = {
        let addButton = UIButton ()
        addButton.setTitle("+ Добавить ребенка", for: .normal)
        addButton.setTitleColor(UIColor.blue, for: .normal)
        addButton.layer.cornerRadius = 14
        addButton.addTarget(self, action: #selector(addBut), for:.touchUpInside)
        addButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = 20
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.blue.cgColor
        return addButton
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
         super.init(frame:frame)
        configureView()
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action
    
    @objc func addBut (){
        delegate?.didTapAdd()
//        buttonHandler?()
        
// должно срабатывать по нажатию и добавлять по одной ячейки до 5 ячеек
        
//        nameChildTextField.isHidden = false
//        ageChildTextField.isHidden = false
//        deleteButton.isHidden = false

        
        print("добавить ребенка")
    }
    
}
