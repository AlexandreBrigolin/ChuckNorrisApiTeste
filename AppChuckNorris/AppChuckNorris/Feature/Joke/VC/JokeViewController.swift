//
//  JokeViewController.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 26/01/23.
//

import UIKit

class JokeViewController: UIViewController {
    
    var screen: JokeViewControllerScreen = JokeViewControllerScreen()
    var viewModel: JokeViewModel
    
    override func loadView() {
        self.screen = JokeViewControllerScreen()
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen.delegate(delegate: self)
        self.viewModel.delegate(delegate: self)
        viewModel.fethRequest()
    }
    
    
    required init(category: Category) {
        self.viewModel = JokeViewModel(category: category)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension JokeViewController: JokeViewControllerScreenProtocoll {
    func returnButton() {
        dismiss(animated: true)
    }
}

extension JokeViewController: JokeViewModelProtocol {
    func success() {
        self.screen.jokeLabel.text = viewModel.jokeResult
    }
    
    func error() {
        print("Deu Ruim")
    }
    
}
