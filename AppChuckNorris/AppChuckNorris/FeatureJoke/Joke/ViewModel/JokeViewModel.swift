//
//  JokeViewModel.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 26/01/23.
//

import UIKit

protocol JokeViewModelProtocol: AnyObject {
    func success()
    func error()
}

class JokeViewModel {

    var category: Category
    private var service: JokeService = JokeService()
    private var jokeData: JokesModel = JokesModel()
    private weak var delegate: JokeViewModelProtocol?

    init(category: Category) {
        self.category = category
    }
    
    func fethRequest() {
        service.getJoke(category: category) { result, failure in
            if let result = result {
                self.jokeData = result
                print("Deu Bom!")
            }else {
                print("Deu Ruim!")
            }
        }
    }
    
  
    
}
