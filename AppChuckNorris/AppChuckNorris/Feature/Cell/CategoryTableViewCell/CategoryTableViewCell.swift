//
//  CategoryTableViewCell.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 23/01/23.
//

import UIKit

enum CategoryTableViewCellString: String {
    case indentifier = "CategoryTableViewCell"
}

class CategoryTableViewCell: UITableViewCell {
    
    static let identifier: String = CategoryTableViewCellString.indentifier.rawValue
    
    lazy var screen = {
        let view = CategoryTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.addSubview()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        self.contentView.addSubview(screen)
    }
    
    public func setupCell(data: String) {
        self.screen.titleLabel.text = data
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
