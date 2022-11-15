
import UIKit

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


