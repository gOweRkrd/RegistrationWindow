
import UIKit

private extension CGFloat {
    
    static let clearButtonTopAncor: CGFloat = 8
    static let clearButtonLeadingAnchor: CGFloat = 40
    static let clearButtonTrailingAnchor: CGFloat = -40
    static let clearButtonHeightAnchor : CGFloat = 20
}

class FooterView : UIView {
    
        var buttonFooter: (() -> Void)?
    
    
    private lazy var clearButton : UIButton = {
        let clearButton = UIButton ()
        clearButton.setTitle("Очистить", for: .normal)
        clearButton.addTarget(self, action: #selector(clearBut), for:.touchUpInside)
        clearButton.layer.masksToBounds = true
        clearButton.setTitleColor(UIColor.blue, for: .normal)
        clearButton.layer.cornerRadius = 20
        clearButton.isHidden = false
        clearButton.layer.borderWidth = 1
        clearButton.layer.borderColor = UIColor.red.cgColor
        
        return clearButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFooter()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     func setupFooter() {
        addSubview(clearButton)
        setupConstraintsFooter()
    }
    
    @objc func clearBut() {
        
        buttonFooter?()
        
       

    }
    private func setupConstraintsFooter() {

        clearButton.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                clearButton.topAnchor.constraint(equalTo: self.topAnchor, constant: .clearButtonTopAncor),
                clearButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .clearButtonLeadingAnchor),
                clearButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .clearButtonTrailingAnchor),
                clearButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                clearButton.heightAnchor.constraint(equalToConstant: .clearButtonHeightAnchor)
            ])
    }
}
