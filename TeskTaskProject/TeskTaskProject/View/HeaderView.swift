//
//  HeadeView.swift
//  TeskTaskProject
//
//  Created by Александр Косяков on 13.11.2022.
//

import UIKit

// MARK: - Constant Constraints

private extension CGFloat {
    
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
    
    var buttonHandler: (() -> Void)?
    
    // MARK: - Costomize
      
    private lazy var welcomeTitle : UILabel = {
        let welcomeTitle = UILabel()
        welcomeTitle.text = "Персональные данные"
        welcomeTitle.font = UIFont.systemFont(ofSize: 30)
        welcomeTitle.font = UIFont.boldSystemFont(ofSize: 30.0)
        welcomeTitle.font = UIFont.italicSystemFont(ofSize: 30.0)
        welcomeTitle.textAlignment = .center
        welcomeTitle.textColor = .black
        return welcomeTitle
    } ()
    
    
    private  lazy var nameTextField : UITextField = {
        let nameTextField = UITextField ()
        nameTextField.backgroundColor = .lightText
        nameTextField.placeholder = "Имя"
        nameTextField.layer.masksToBounds = true
        return nameTextField
    }()
    
    private  lazy var ageTextField : UITextField = {
        let ageTextField = UITextField ()
        ageTextField.backgroundColor = .lightText
        ageTextField.placeholder = "Возраст"
        ageTextField.layer.masksToBounds = true
        return ageTextField
    }()
    
    private  lazy var childLabel : UILabel = {
        let childLabel = UILabel()
        childLabel.text = "Дети(макс.5)"
        childLabel.font = UIFont.systemFont(ofSize: 30)
        childLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        childLabel.font = UIFont.italicSystemFont(ofSize: 21.0)
        childLabel.textAlignment = .left
        childLabel.textColor = .black
        return childLabel
    } ()
    
    private  lazy var addButton : UIButton = {
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
        buttonHandler?()
        
// должно срабатывать по нажатию и добавлять по одной ячейки до 5 ячеек
        
//        nameChildTextField.isHidden = false
//        ageChildTextField.isHidden = false
//        deleteButton.isHidden = false

        
        print("добавить ребенка")
    }
    
}
// MARK: - Setup constrains

extension HeaderView {
    
    func setupView() {
        
        self.addSubview(welcomeTitle)
        self.addSubview(nameTextField)
        self.addSubview(ageTextField)
        self.addSubview(childLabel)
        self.addSubview(addButton)
    }
    
    func setupConstraints () {
        
        welcomeTitle.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        childLabel.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: .welcomeTitleTopAncor),
            welcomeTitle.heightAnchor.constraint(equalToConstant: .welcomeTitleHeightAnchor),
            welcomeTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor)])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: welcomeTitle.topAnchor, constant:.nameTextFieldTopAncor),
            nameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .nameTextFieldLeadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .nameTextFieldTrailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: .nameTextFieldHeightAnchor)])
        
        NSLayoutConstraint.activate([
            ageTextField.topAnchor.constraint(equalTo: nameTextField.topAnchor, constant:.ageTextFieldTopAncor),
            ageTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .ageTextFieldLeadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .ageTextFieldTrailingAnchor),
            ageTextField.heightAnchor.constraint(equalToConstant: .ageTextFieldHeightAnchor)])
        
        NSLayoutConstraint.activate([
            childLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: .childLabelTopAncor),
            childLabel.heightAnchor.constraint(equalToConstant: .childLabelHeightAnchor),
            childLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: .childleadingAnchor)])

        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: ageTextField.topAnchor, constant: .addButtonTopAncor),
            addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .addButtonTrailingAnchor),
            addButton.heightAnchor.constraint(equalToConstant: .addButtonHeightAnchor)])
    }
    
      func configureView() {
         setupView()
         setupConstraints()
    }
}


