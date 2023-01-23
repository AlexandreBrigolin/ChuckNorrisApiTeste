//
//  HomeViewModel.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 17/01/23.
//

import UIKit

class HomeViewModel {

    private var service: HomeService = HomeService()
    
    func fathRequest(){
        service.getHome { result, failure in
            if let result = result{
                print("Seucess")
                print(result)
            }else{
                print("Deu Ruim!")
            }
        }
    }
}
