import UIKit

// MARK: - Constant Constraints

extension CGFloat {
    
    static let nameChildTextFieldTopAnchor: CGFloat = 7
    static let nameChildTextFieldLeadingAnchor: CGFloat = 17
    static let nameChildTextFieldTrailingAnchor: CGFloat = -250
    static let nameChildTextFieldHeightAnchor : CGFloat = -75
    
    static let ageChildTextFieldTopAnchor: CGFloat = 70
    static let ageChildTextFieldLeadingAnchor: CGFloat = 17
    static let ageChildTextFieldTrailingAnchor: CGFloat = -250
    static let ageChildTextFieldHeightAnchor: CGFloat = -75
    
    static let deleteButtonTopAnchor: CGFloat = 7
    static let deleteButtonLeadingAnchor: CGFloat = 130
    static let deleteButtonWidthAnchor: CGFloat = -210
    
}

protocol MyOwnCellDelegate: AnyObject {
    func didTapDelete()
    
}

class MyOwnCell: UITableViewCell  {
    
    weak var delegate: MyOwnCellDelegate?
    
    // MARK: - Castomize UI
    
    lazy var nameChildTextField : UITextField = {
        let nameChildTextField = UITextField ()
        nameChildTextField.backgroundColor = .lightText
        nameChildTextField.placeholder = "Имя"
        nameChildTextField.layer.masksToBounds = false
        nameChildTextField.isHidden = false
        
        
        return nameChildTextField
    }()
    
    lazy var ageChildTextField : UITextField = {
        let ageChildTextField = UITextField ()
        ageChildTextField.backgroundColor = .lightText
        ageChildTextField.placeholder = "Возраст"
        ageChildTextField.layer.masksToBounds = true
        ageChildTextField.isHidden = false
        return ageChildTextField
    }()
    
    lazy var deleteButton : UIButton = {
        let deleteButton = UIButton ()
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.setTitleColor(UIColor.blue, for: .normal)
        deleteButton.layer.masksToBounds = true
        deleteButton.layer.cornerRadius = 15
        deleteButton.addTarget(self, action: #selector(deleteBut), for:.touchUpInside)
        deleteButton.isHidden = false
        return deleteButton
    }()
    
    // MARK: - Castomize Cell
    
    func castomizeCell () {
        
        contentView.backgroundColor = UIColor(red: 237/255, green: 231/255, blue: 229/255, alpha: 1)
        contentView.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func setupContent(model: CellModel) {
        
    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureView()
        castomizeCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action
    
    @objc func deleteBut (){
        
        delegate?.didTapDelete()
    }
    
}


