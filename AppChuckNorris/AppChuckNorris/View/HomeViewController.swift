//
//  ViewController.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 17/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    private var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fathRequest()
        self.view.backgroundColor = .cyan     }


}

