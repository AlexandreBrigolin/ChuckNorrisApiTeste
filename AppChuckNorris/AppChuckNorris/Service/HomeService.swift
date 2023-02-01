//
//  HomeService.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 17/01/23.
//

import Foundation
import Alamofire

protocol HomeServiceDelegate: GenericService{
    func getHome(completion: @escaping completion<[String]?>)
}

class HomeService: HomeServiceDelegate {
    
    func getHome(completion: @escaping completion<[String]?>){
        let url: String = "https://api.chucknorris.io/jokes/categories"
        
        AF.request(url, method: .get).validate().responseDecodable(of: [String].self) { response in
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
        }
    }
}
