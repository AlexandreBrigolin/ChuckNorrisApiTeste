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
    
    public func delegate(delegate: JokeViewModelProtocol?) {
        self.delegate = delegate
    }
    
    init(category: Category) {
        self.category = category
    }
    
    func fethRequest() {
        service.getJoke(category: category) { result, failure in
            if let result = result {
                self.jokeData = result
                self.delegate?.success()
                print("Deu Bom!")
            }else {
                print("Deu Ruim!")
            }
        }
    }
    
    
    public var jokeResult: String {
        return jokeData.value ?? ""
    }
    
    
}
