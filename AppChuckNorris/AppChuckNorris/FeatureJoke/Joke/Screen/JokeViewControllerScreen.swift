//
//  JokeViewControllerScreen.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 26/01/23.
//

import UIKit

enum StringMagics: String {
    case returnImage = "arrowshape.turn.up.backward.fill"
    case logoChucknorris = "chucknorrisLogo"
}

protocol JokeViewControllerScreenProtocoll: AnyObject {
    func returnButton()
}

class JokeViewControllerScreen: UIView {
    
    private weak var delegate: JokeViewControllerScreenProtocoll?
    
    public func delegate(delegate: JokeViewControllerScreenProtocoll?) {
        self.delegate = delegate
    }
    
    lazy var closedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.addTarget(self, action: #selector(self.tappedClosedButton), for: .touchUpInside)
        button.setImage(UIImage(systemName: StringMagics.returnImage.rawValue), for: .normal)
        return button
    }()
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: StringMagics.logoChucknorris.rawValue)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var jokeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
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
    
    @objc private func tappedClosedButton() {
        self.delegate?.returnButton()
    }
    
    private func addSubView() {
        self.addSubview(closedButton)
        self.addSubview(iconImageView)
        self.addSubview(jokeLabel)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.closedButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.closedButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.closedButton.heightAnchor.constraint(equalToConstant: 30),
            self.closedButton.widthAnchor.constraint(equalToConstant: 30),
            
            self.iconImageView.topAnchor.constraint(equalTo: self.closedButton.bottomAnchor, constant: 50),
            self.iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.iconImageView.heightAnchor.constraint(equalToConstant: 200),
            self.iconImageView.widthAnchor.constraint(equalToConstant: 200),
            
            self.jokeLabel.topAnchor.constraint(equalTo: self.iconImageView.bottomAnchor, constant: 20),
            self.jokeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.jokeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }    
}
