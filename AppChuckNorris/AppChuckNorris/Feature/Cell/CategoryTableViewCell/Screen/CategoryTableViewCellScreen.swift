//
//  CategoryTableViewCellScreen.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 23/01/23.
//

import UIKit

class CategoryTableViewCellScreen: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var enterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = ">"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        self.addSubview(titleLabel)
        self.addSubview(enterLabel)
    }
    
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
        
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.enterLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.enterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        
        ])
    }
}
