//
//  ViewController.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 17/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    private var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        self.screen = HomeScreen()
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fathRequest()
    }
}

extension HomeViewController: HomeViewModelProtocol{
    func success() {
        self.screen?.congigTableViewProtocols(delegate: self, dataSource: self)
        print("Deu Bom")
    }

    func error() {
        print("Deu Ruim!")
    }
}
extension HomeViewController: UITableViewDelegate{}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell
        cell?.setupCell(data: self.viewModel.loadCurrentCategory(indexPatch: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
}
