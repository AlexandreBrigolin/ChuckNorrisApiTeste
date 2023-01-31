//
//  JokeViewModel.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 26/01/23.
//

import UIKit

class JokeViewModel {

    var category: Category
    var service: JokeService = JokeService()
    var jokeData: JokesModel = JokesModel()
    
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
