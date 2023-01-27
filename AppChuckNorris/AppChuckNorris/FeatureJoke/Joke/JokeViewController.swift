//
//  JokeViewController.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 26/01/23.
//

import UIKit

class JokeViewController: UIViewController {

    var screen: JokeViewControllerScreen?
    var viewModel: JokeViewModel
    
    override func loadView() {
        self.screen = JokeViewControllerScreen()
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    required init(category: Category){
        self.viewModel = JokeViewModel(category: category)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}