
import UIKit


protocol FooterCellDelegate:AnyObject {
    func didTapCler()
}
// MARK: - Constant Constraints

extension CGFloat {
    
    static let clearButtonTopAncor: CGFloat = 8
    static let clearButtonLeadingAnchor: CGFloat = 40
    static let clearButtonTrailingAnchor: CGFloat = -40
    static let clearButtonHeightAnchor : CGFloat = 20
}

class FooterView : UIView {
    
    weak var delegate: FooterCellDelegate?
    
    // MARK: - Costomize
    
    lazy var clearButton : UIButton = {
        
        let clearButton = UIButton ()
        clearButton.setTitle("Cохранить/Очистить", for: .normal)
        clearButton.addTarget(self, action: #selector(clearBut), for:.touchUpInside)
        clearButton.layer.masksToBounds = true
        clearButton.setTitleColor(UIColor.blue, for: .normal)
        clearButton.layer.cornerRadius = 20
        clearButton.isHidden = true
        clearButton.layer.borderWidth = 1
        clearButton.layer.borderColor = UIColor.red.cgColor
        
        return clearButton
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFooter()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action
    @objc func clearBut() {
        
        delegate?.didTapCler()
       
        
    }
    
}
