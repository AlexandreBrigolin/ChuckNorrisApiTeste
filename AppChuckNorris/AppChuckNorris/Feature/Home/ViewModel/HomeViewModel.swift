//
//  HomeViewModel.swift
//  AppChuckNorris
//
//  Created by Alexandre Brigolin on 17/01/23.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject{
    func success()
    func error()
}

class HomeViewModel {
    
    private var service: HomeService = HomeService()
    private var categoryList: CategoryList = []
    private weak var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol?) {
        self.delegate = delegate
    }
    
    func fathRequest(){
        service.getHome { result, failure in
            if let result = result {
                self.categoryList = result
                self.delegate?.success()
            }else{
                print("Deu Ruim!")
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return categoryList.count
    }
    
    public func loadCurrentCategory(indexPatch: IndexPath) -> Category {
        return categoryList[indexPatch.row]
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
