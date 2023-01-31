//
//  JokeService.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 31/01/23.
//

import Foundation
import Alamofire

protocol JokeServiceProtocoll: GenericService {
    func getJoke(category: Category,completion: @escaping completion<JokesModel?>)
}

class JokeService: JokeServiceProtocoll {
    func getJoke(category: Category, completion: @escaping completion<JokesModel?>) {
        let url: String = "https://api.chucknorris.io/jokes/random?category=\(category)"
        
        AF.request(url, method: .get).validate().responseDecodable(of: JokesModel.self) { response in
            print(#function)
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }    }
}
