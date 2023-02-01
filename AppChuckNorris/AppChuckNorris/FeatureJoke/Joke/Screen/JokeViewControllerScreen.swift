//
//  JokeViewControllerScreen.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 26/01/23.
//

import UIKit

class JokeViewControllerScreen: UIView {

    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "chucknorrisLogo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    
    lazy var jokeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        self.addSubView()
        self.configConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView() {
        self.addSubview(iconImageView)
        self.addSubview(jokeLabel)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.iconImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70),
            self.iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.iconImageView.heightAnchor.constraint(equalToConstant: 150),
            self.iconImageView.widthAnchor.constraint(equalToConstant: 150),
            
            self.jokeLabel.topAnchor.constraint(equalTo: self.iconImageView.bottomAnchor, constant: 20),
            self.jokeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.jokeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
        ])
    }
    
}
