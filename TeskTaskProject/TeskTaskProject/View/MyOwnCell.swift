import UIKit



// MARK: - Constant Constraints
private extension CGFloat {
    
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

class MyOwnCell: UITableViewCell  {
 
    
    
    var buttonAdd: (() -> Void)?
    
    // MARK: - Costomize cell
    
    private lazy var nameChildTextField : UITextField = {
        let nameChildTextField = UITextField ()
        nameChildTextField.backgroundColor = .lightText
        nameChildTextField.placeholder = "Имя"
        nameChildTextField.layer.masksToBounds = false
        nameChildTextField.isHidden = false
         
        return nameChildTextField
    }()
    
    
      private lazy var ageChildTextField : UITextField = {
        let ageChildTextField = UITextField ()
        ageChildTextField.backgroundColor = .lightText
        ageChildTextField.placeholder = "Возраст"
        ageChildTextField.layer.masksToBounds = true
        ageChildTextField.isHidden = false
        return ageChildTextField
    }()
    
     private lazy var deleteButton : UIButton = {
        let deleteButton = UIButton ()
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.setTitleColor(UIColor.blue, for: .normal)
        deleteButton.layer.masksToBounds = true
        deleteButton.layer.cornerRadius = 15
        deleteButton.addTarget(self, action: #selector(deleteBut), for:.touchUpInside)
        deleteButton.isHidden = false
        return deleteButton
    }()
    
    @objc func deleteBut (){
// должно удалять(скрывать) ячейки и подтягивать ниже стоящие
        nameChildTextField.isHidden = true
        ageChildTextField.isHidden = true
        deleteButton.isHidden = true
        
        print("удалить ребенка")
    }
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        costomizeCell()
     
    }
    
    func costomizeCell () {
        
        contentView.backgroundColor = UIColor(red: 237/255, green: 231/255, blue: 229/255, alpha: 1)
        backgroundColor = .clear
        contentView.layer.borderColor = UIColor.white.cgColor
    
    }
    
    func setupContent(model:String) {
//        nameChildTextField.text = String(model)
      
      
//        if model.flag {
//            self.contentView.backgroundColor = .gray
//
//        } else {
//            self.contentView.backgroundColor = .blue
//
//        }
       
        
//        labelNumber.text = "$ \(model.value)"
//        coinLabel.text = "\(model.coin)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Setup constrains
    
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
